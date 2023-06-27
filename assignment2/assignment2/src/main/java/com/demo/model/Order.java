package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.util.Date;

@Entity
@Table(name = "Orders")
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String address;

//    @NotNull
//    @Past(message = "Ngay khong duoc be hon ngay hien tai")
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date createdate = new Date();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Username",referencedColumnName = "username")
    Account account;
}
