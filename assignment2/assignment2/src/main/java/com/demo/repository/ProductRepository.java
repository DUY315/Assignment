package com.demo.repository;

import com.demo.model.Product;;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface ProductRepository extends JpaRepository<Product,Integer> {
    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keywords, '%')) AND p.category.id = :categoryId AND p.price >= :minPrice AND p.price <= :maxPrice")
    Page<Product> findByKeywordsAndCategoryIdAndPriceRange(String keywords, String categoryId, int minPrice, int maxPrice, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keywords, '%')) AND p.category.id = :categoryId")
    Page<Product> findByKeywordsAndCategoryId(String keywords, String categoryId, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keywords, '%')) AND p.price >= :minPrice AND p.price <= :maxPrice")
    Page<Product> findByKeywordsAndPriceRange(String keywords, int minPrice, int maxPrice, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.category.id = :categoryId AND p.price >= :minPrice AND p.price <= :maxPrice")
    Page<Product> findByCategoryIdAndPriceRange(String categoryId, int minPrice, int maxPrice, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :keywords, '%'))")
    Page<Product> findByKeywords(String keywords, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.category.id = :categoryId")
    Page<Product> findByCategoryId(String categoryId, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.price >= :minPrice AND p.price <= :maxPrice")
    Page<Product> findByPriceRange(int minPrice, int maxPrice, Pageable pageable);
}
