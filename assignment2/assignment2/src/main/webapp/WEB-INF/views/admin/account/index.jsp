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
<header><h2 style="text-align: center;">Quản Lý Account</h2></header>
<main>
    <section>
        <a class="btn btn-success" style="margin-left: 120px" href="/admin/account/view-add">Add</a>
    </section>
    <section>
        <div class="container">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">STT</th>
                    <th scope="col">Username</th>
                    <th scope="col">Full Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listAccount.content}" var="ct" varStatus="i">
                        <tr>
                            <td>${listAccount.number   * listAccount.size + i.index + 1}</td>
                            <td>${ct.username}</td>
                            <td>${ct.fullname}</td>
                            <td>${ct.email}</td>
                            <td>
                                <a href="/admin/account/detail/${ct.username}">Detail</a>
                                <a href="/admin/account/delete/${ct.username}">Remove</a>
                                <a href="/admin/account/view-update/${ct.username}">Update</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                        <a class="page-link" href="/admin/account/hien-thi?page=${listAccount.number - 1}">
                        Previous
                        </a>
                        <c:forEach begin="0" end="${listAccount.totalPages-1}" varStatus="loop">
                            <li class="page-item">
                            <a class="page-link" href="/admin/account/hien-thi?page=${loop.begin + loop.count -1}">
                                    ${loop.begin + loop.count}
                            </a>
                            </li>
                        </c:forEach>
                        <a class="page-link" href="/admin/account/hien-thi?page=${listAccount.number + 1}">
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
