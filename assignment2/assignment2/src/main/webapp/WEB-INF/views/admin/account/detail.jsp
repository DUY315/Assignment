<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/2/2023
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<header><h2 style="text-align: center;">Quản lý Account</h2></header>
<main>
    <div class="container">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <span>${account.username}</span>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <span>${account.password}</span>
        </div>
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <span>${account.fullname}</span>
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <span>${account.email}</span>
        </div>
    </div>
</main>
<footer><p style="text-align: center;">AAA</p></footer>
</body>
</html>

