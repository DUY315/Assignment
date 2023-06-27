package com.demo.service;

import com.demo.model.Account;
import com.demo.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class AccountValidator implements Validator {
    @Autowired
    AccountRepository accountRepository;

    @Override
    public boolean supports(Class<?> clazz) {
        return false;
    }

    @Override
    public void validate(Object target, Errors errors) {
        Account account = (Account) target;
        if (accountRepository.existsById(account.getUsername())) {
            errors.rejectValue("username","error.account","Username đã tồn tại");
        }
    }
}
