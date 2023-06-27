package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "Categories")
@NoArgsConstructor
@Data @AllArgsConstructor

public class Category {
    @Id
    @NotBlank(message = "Không được để trống")
    String id;

    String name;
}
