package com.demo.service;


import com.demo.model.Category;
import com.demo.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class CategoryValidator implements Validator {
    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

    public void validate(Object target, Errors errors) {
        Category category = (Category) target;
        if (categoryRepository.existsById(category.getId())) {
            errors.rejectValue("id", "error.category", "ID đã tồn tại");
        }
    }
}
