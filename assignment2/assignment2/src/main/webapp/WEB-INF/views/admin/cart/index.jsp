<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/7/2023
  Time: 11:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<header><h2 style="text-align: center;">Quản Lý Đơn Hàng</h2></header>
<main>
    <section>
        <a class="btn btn-success" style="margin-left: 120px" href="/export/excel">Xuất file excel</a>
<%--        <a class="btn btn-success" style="margin-left: 120px" href="/admin/cart/hien-thi">Search</a>--%>
    </section>
    <section>
        <div class="container">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">ID Order</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Address</th>
                    <th scope="col">Thành Tiền</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listOrderDetail.content}" var="p" varStatus="i">
                    <tr>
                        <td>${listOrderDetail.number   * listOrderDetail.size + i.index + 1}</td>
                        <td>${p.product.name}</td>
                        <td>${p.order.id}</td>
                        <td>${p.price}</td>
                        <td>${p.quantity}</td>
                        <td>${p.order.address}</td>
                        <td>${p.price * p.quantity}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <a class="page-link" href="/admin/cart/hien-thi?page=${listOrderDetail.number - 1}">
                        Previous
                    </a>
                    <c:forEach begin="0" end="${listOrderDetail.totalPages-1}" varStatus="loop">
                        <li class="page-item">
                            <a class="page-link" href="/admin/cart/hien-thi?page=${loop.begin + loop.count -1}">
                                    ${loop.begin + loop.count}
                            </a>
                        </li>
                    </c:forEach>
                    <a class="page-link" href="/admin/cart/hien-thi?page=${listOrderDetail.number + 1}">
                        Next
                    </a>
                </ul>
            </nav>
        </div>
    </section>
</main>
<footer><p style="text-align: center;">AAA</p></footer>
</body>
</html>

