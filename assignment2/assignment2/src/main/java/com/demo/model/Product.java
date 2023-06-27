package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Products")
@NoArgsConstructor
@Data @AllArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @NotBlank(message = "Name không được để trống")
    String name;

    @NotBlank(message = "Image không được để trống")
    String image;

    @NotNull(message = "Price không được để trống")
    @Min(value = 1,message = "Price không được bé hơn 0")
    Integer price;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Categoryid",referencedColumnName = "id")
    @Valid
    Category category;
}
