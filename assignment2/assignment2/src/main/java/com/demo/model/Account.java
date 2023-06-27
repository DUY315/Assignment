package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "Accounts")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Account {
    @Id
    @NotBlank(message = "Username không được để trống")
    String username;

    @NotBlank(message = "Password không được để trống")
    String password;

    @NotBlank(message = "Full Name không được để trống")
    String fullname;

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email phải đúng định dạng")
    String email;
}
