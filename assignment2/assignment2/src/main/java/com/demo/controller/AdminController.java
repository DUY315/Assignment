package com.demo.controller;

import com.demo.model.Account;
import com.demo.model.Category;
import com.demo.model.OrderDetail;
import com.demo.model.Product;
import com.demo.repository.AccountRepository;
import com.demo.repository.CategoryRepository;
import com.demo.repository.OrderDetailRepository;
import com.demo.repository.OrderRepository;
import com.demo.repository.ProductRepository;
import com.demo.service.AccountValidator;
import com.demo.service.CategoryValidator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
public class AdminController {
    @Autowired
    HttpSession session;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    CategoryValidator categoryValidator;

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @GetMapping("/export/excel")
    public void exportExcel(HttpServletResponse response) throws IOException {
        List<OrderDetail> orderDetailList = orderDetailRepository.findAll();
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("QLDH");
        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("Tên sản phẩm");
        headerRow.createCell(1).setCellValue("ID Order");
        headerRow.createCell(2).setCellValue("Price");
        headerRow.createCell(3).setCellValue("Quantity");
        headerRow.createCell(4).setCellValue("Address");
        headerRow.createCell(5).setCellValue("Thành tiền");
        int rowNum = 1;
        for (OrderDetail orderDetail : orderDetailList) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(orderDetail.getProduct().getName());
            row.createCell(1).setCellValue(orderDetail.getOrder().getId());
            row.createCell(2).setCellValue(orderDetail.getPrice());
            row.createCell(3).setCellValue(orderDetail.getQuantity());
            row.createCell(4).setCellValue(orderDetail.getOrder().getAddress());
            row.createCell(5).setCellValue(orderDetail.getPrice()*orderDetail.getQuantity());
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=qldh.xlsx");
        workbook.write(response.getOutputStream());
        workbook.close();
    }

    @GetMapping("/admin/cart/hien-thi")
    public String index(@RequestParam(name = "page",defaultValue = "0") Integer number,Model model){
        Pageable pageable = PageRequest.of(number,4);
        Page<OrderDetail> orderDetailPage = orderDetailRepository.findAll(pageable);
        model.addAttribute("listOrderDetail",orderDetailPage);
        return "admin/cart/index";
    }

    @GetMapping("/admin/product/hien-thi")
    public String showAll(@RequestParam(name = "page",defaultValue = "0") Integer number, Model model){
        Pageable pageable = PageRequest.of(number,4);
        Page<Product> productPage = productRepository.findAll(pageable);
        model.addAttribute("listProduct",productPage);
        return "admin/product/index";
    }

    @GetMapping("/admin/product/detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model){
        Product product = productRepository.findById(Integer.valueOf(id)).orElse(null);
        model.addAttribute("product",product);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/view-add")
    public String viewAdd(Model model){
        model.addAttribute("categorys",categoryRepository.findAll());
        model.addAttribute("product",new Product());
        return "admin/product/add";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String remove(@PathVariable("id") String id){
        productRepository.deleteById(Integer.valueOf(id));
        return "redirect:/admin/product/hien-thi";
    }

    @GetMapping("/admin/product/view-update/{id}")
    public String viewUpdate(@PathVariable("id") Integer id,Model model){
        Product product = productRepository.findById(Integer.valueOf(id)).orElse(null);
        model.addAttribute("categorys",categoryRepository.findAll());
        model.addAttribute("product",product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/add")
    public String add(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model){
        if (result.hasErrors()){
            model.addAttribute("categorys",categoryRepository.findAll());
            return "admin/product/add";
        }
        productRepository.save(product);
        return "redirect:/admin/product/hien-thi";
    }

    @PostMapping("/admin/product/update/{id}")
    public String update(@Valid @ModelAttribute("product") Product product, BindingResult result,Model model){
        if (result.hasErrors()){
            model.addAttribute("category",categoryRepository.findAll());
            return "admin/product/update";
        }
        productRepository.save(product);
        return "redirect:/admin/product/hien-thi";
    }

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    AccountValidator accountValidator;

    @GetMapping("/admin/account/hien-thi")
    public String hienThi(@RequestParam(name = "page",defaultValue = "0") Integer number, Model model){
        Pageable pageable = PageRequest.of(number,4);
        Page<Account> accountPage = accountRepository.findAll(pageable);
        model.addAttribute("listAccount",accountPage);
        return "admin/account/index";
    }

    @GetMapping("/admin/account/delete/{username}")
    public String removee(@PathVariable("username") String username){
        accountRepository.deleteById(username);
        return "redirect:/admin/account/hien-thi";
    }

    @GetMapping("/admin/account/view-add")
    public String viewAddd(Model model){
        model.addAttribute("account",new Account());
        return "admin/account/add";
    }

    @PostMapping("/admin/account/add")
    public String add(@Valid @ModelAttribute("account") Account account, BindingResult result){
        accountValidator.validate(account,result);
        if (result.hasErrors()){
            return "admin/account/add";
        }
        accountRepository.save(account);
        return "redirect:/admin/account/hien-thi";
    }

    @GetMapping("/admin/account/detail/{username}")
    public String detail(@PathVariable("username") String username, Model model){
        Account account = accountRepository.findById(username).orElse(null);
        model.addAttribute("account",account);
        return "admin/account/detail";
    }

    @GetMapping("/admin/account/view-update/{username}")
    public String viewUpdate(@PathVariable("username") String username, Model model){
        Account account = accountRepository.findById(username).orElse(null);
        model.addAttribute("account",account);
        return "admin/account/update";
    }

    @PostMapping("/admin/account/update/{username}")
    public String update(@Valid @ModelAttribute("account") Account account, BindingResult result){
        if (result.hasErrors()){
            return "admin/account/update";
        }
        accountRepository.save(account);
        return "redirect:/admin/account/hien-thi";
    }

    @GetMapping("/admin/category/hien-thi")
    public String showAlll(@RequestParam(name = "page",defaultValue = "0") Integer number, Model model){
        Pageable pageable = PageRequest.of(number,4);
        Page<Category> categoryPage = categoryRepository.findAll(pageable);
        model.addAttribute("listCategory",categoryPage);
        return "admin/category/index";
    }


    @GetMapping("/admin/category/view-add")
    public String viewAdddd(Model model){
        model.addAttribute("category",new Category());
        return "admin/category/add";
    }

    @PostMapping("/admin/category/add")
    public String add(@Valid @ModelAttribute("category") Category category, BindingResult result){
        categoryValidator.validate(category, result);
        if (result.hasErrors()){
            return "admin/category/add";
        }
        categoryRepository.save(category);
        return "redirect:/category/hien-thi";
    }

    @GetMapping("/admin/category/detail/{id}")
    public String detaill(@PathVariable("id") String id,Model model){
        Category category = categoryRepository.findById(id).orElse(null);
        model.addAttribute("category",category);
        return "admin/category/detail";
    }

    @GetMapping("/admin/category/delete/{id}")
    public String removeee(@PathVariable("id") String id){
        categoryRepository.deleteById(id);
        return "redirect:/category/hien-thi";
    }

    @GetMapping("/admin/category/view-update/{id}")
    public String viewUpdatee(@PathVariable("id") String id, Model model){
        Category category = categoryRepository.findById(id).orElse(null);
        model.addAttribute("category",category);
        return "admin/category/update";
    }

    @PostMapping("/admin/category/update/{id}")
    public String update(@Valid @ModelAttribute("category") Category category,BindingResult result){
        if (result.hasErrors()){
            return "admin/category/update";
        }
        categoryRepository.save(category);
        return "redirect:/category/hien-thi";
    }
}
