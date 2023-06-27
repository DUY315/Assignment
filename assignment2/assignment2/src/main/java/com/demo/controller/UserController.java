package com.demo.controller;

import com.demo.model.Account;
import com.demo.model.Order;
import com.demo.model.OrderDetail;
import com.demo.model.Product;
import com.demo.repository.AccountRepository;
import com.demo.repository.CategoryRepository;
import com.demo.repository.OrderDetailRepository;
import com.demo.repository.OrderRepository;
import com.demo.repository.ProductRepository;
import com.demo.service.CartService;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
public class UserController {
	@Autowired
	HttpSession session;

	@Autowired
    CategoryRepository categoryRepository;

	@Autowired
    ProductRepository productRepository;

	@Autowired
	OrderDetailRepository orderDetailRepository;

	@Autowired
	AccountRepository accountRepository;

	@Autowired
	CartService cart;

	@Autowired
	OrderRepository orderRepository;

	@ModelAttribute("cart")
	CartService getCart(){
		return cart;
	}

	@Data @AllArgsConstructor
	public static class PriceRange{
		int id;
		int minValue;
		int maxValue;
		String display;
	}

	List<PriceRange> priceRangeList = Arrays.asList(
		new PriceRange(0,0, Integer.MAX_VALUE, "Tất cả"),
		new PriceRange(1,1 , 10000000, "Dưới 10 triệu"),
		new PriceRange(2,10000000, 20000000, "Từ 10-20 triệu"),
		new PriceRange(3,20000000, Integer.MAX_VALUE, "Trên 20 triệu")
	);

	@RequestMapping("/")
	public String index(
			@RequestParam(defaultValue="") String keywords,
			@RequestParam(defaultValue="") String categoryId,
			@RequestParam(defaultValue="0") int priceRangeId,
			@RequestParam(defaultValue="0") int p,
			Model model) {
		if(session.getAttribute("username") == null){
			return  "redirect:/login";
		}
		Pageable pageable = PageRequest.of(p, 6);
		Page<Product> productPage;
		int minPrice = priceRangeList.get(priceRangeId).minValue;
		int maxPrice = priceRangeList.get(priceRangeId).maxValue;
		if (!keywords.isEmpty() && !categoryId.isEmpty() && minPrice != 0 && maxPrice != 0) {
			productPage = productRepository.findByKeywordsAndCategoryIdAndPriceRange(keywords, categoryId, minPrice, maxPrice, pageable);
		} else if (!keywords.isEmpty() && !categoryId.isEmpty()) {
			productPage = productRepository.findByKeywordsAndCategoryId(keywords, categoryId, pageable);
		} else if (!keywords.isEmpty() && minPrice != 0 && maxPrice != 0) {
			productPage = productRepository.findByKeywordsAndPriceRange(keywords, minPrice, maxPrice, pageable);
		} else if (!categoryId.isEmpty() && minPrice != 0 && maxPrice != 0) {
			productPage = productRepository.findByCategoryIdAndPriceRange(categoryId, minPrice, maxPrice, pageable);
		} else if (!keywords.isEmpty()) {
			productPage = productRepository.findByKeywords(keywords, pageable);
		} else if (!categoryId.isEmpty()) {
			productPage = productRepository.findByCategoryId(categoryId, pageable);
		} else if (minPrice != 0 && maxPrice != 0) {
			productPage = productRepository.findByPriceRange(minPrice, maxPrice, pageable);
		} else {
			productPage = productRepository.findAll(pageable);
		}
		model.addAttribute("priceRangeList", priceRangeList);
		model.addAttribute("categoryList", categoryRepository.findAll());
		model.addAttribute("productList", productPage);

		return "home/index";
	}

	@GetMapping("/detail/{id}")
	public String viewProduct(@PathVariable int id, Model model) {
		Product product = productRepository.findById(id).orElse(null);
		model.addAttribute("product", product);
		return "home/detail";
	}

	@RequestMapping("/add-to-cart/{id}")
	public String addToCart(@PathVariable int id){
		cart.add(id);
		return "redirect:/cart";
	}

	@RequestMapping("/remove-cart/{id}")
	public String removeCart(@PathVariable int id) {
		cart.remove(id);
		if(cart.getTotal() == 0){
			return "redirect:/";
		}
		return "redirect:/cart";
	}

	@RequestMapping("/update-cart/{id}")
	public String updateCart(@PathVariable int id, int quantity) {
		cart.update(id, quantity);
		return "redirect:/cart";
	}

	@GetMapping("/cart")
	public String cart(){
		return "home/cart";
	}

	@GetMapping("/confirm")
	public String confirm(){
		return "home/confirm";
	}

	@RequestMapping("/about")
	public String about(Model model) {
		return "home/about";
	}

	@GetMapping("/login")
	public String login(){
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, Model model) {
		Account account = accountRepository.findById(username).orElse(null);
		if (account != null && account.getPassword().equals(password)) {
			session.setAttribute("username", username);
			return "redirect:/";
		}
		model.addAttribute("message", "Tên đăng nhập/mật khẩu không đúng");
		return "login";
	}

	@GetMapping("/signup")
	public String signup(@ModelAttribute("account") Account account) {
		return "signup";
	}

	@PostMapping("/signup")
	public String signup(@Valid @ModelAttribute("account") Account account, BindingResult result) {
		if (result.hasErrors()) {
			return "signup";
		}
		accountRepository.save(account);
		session.setAttribute("username",account.getUsername());
		return "redirect:/login";
	}

	@PostMapping("/purchase")
	public String purchase(@RequestParam String address){
		String user = (String) session.getAttribute("username");
		Account account = accountRepository.findById(user).orElse(null);
		if (account != null){
			Order order = new Order();
			order.setAddress(address);
			order.setAccount(account);
			orderRepository.save(order);
			for (OrderDetail item:cart.getItems()) {
				item.setOrder(order);
				orderDetailRepository.save(item);
			}
		}
		cart.clear();
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(){
		session.removeAttribute("username");
		return "redirect:/login";
	}
}
