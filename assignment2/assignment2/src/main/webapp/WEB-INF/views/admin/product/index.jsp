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
<header><h2 style="text-align: center;">Quản Lý Product</h2></header>
<main>
    <section>
        <%--        <a href="/may-tinh/hien-thi">Hien Thi</a>--%>
        <a class="btn btn-success" style="margin-left: 120px" href="/admin/product/view-add">Add</a>
    </section>
    <section>
        <div class="container">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Price</th>
                    <th scope="col">Image</th>
                    <th scope="col">Mã loại sản phẩm</th>
                    <th scope="col">Tên loại sản phẩm</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listProduct.content}" var="p" varStatus="i">
                    <tr>
                        <td>${listProduct.number   * listProduct.size + i.index + 1}</td>
                        <td>${p.name}</td>
                        <td>${p.price}</td>
                        <td><img src="${p.image}" width="50px" height="50px"></td>
                        <td>${p.category.id}</td>
                        <td>${p.category.name}</td>
                        <td>
                            <a href="/admin/product/detail/${p.id}">Detail</a>
                            <a href="/admin/product/delete/${p.id}">Remove</a>
                            <a href="/admin/product/view-update/${p.id}">Update</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <a class="page-link ${listProduct.number == 0 ? 'disabled' : ''}" href="/admin/product/hien-thi?page=${listProduct.number - 1}" >
                     Previous
                    </a>
                    <c:forEach begin="0" end="${listProduct.totalPages-1}" varStatus="loop">
                        <li class="page-item">
                            <a class="page-link" href="/admin/product/hien-thi?page=${loop.begin + loop.count -1}">
                                    ${loop.begin + loop.count}
                            </a>
                        </li>
                    </c:forEach>
                    <a class="page-link" href="/admin/product/hien-thi?page=${listProduct.number + 1}">
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
<%--<script>--%>
<%--    function disableLink(event) {--%>
<%--        if (${listProduct.number} == 0) {--%>
<%--            event.preventDefault();--%>
<%--            return false;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
