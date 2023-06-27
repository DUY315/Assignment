<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/2/2023
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<header><h2 style="text-align: center;">Quản lý Account</h2></header>
<main>
    <%--@elvariable id="account" type=""--%>
        <form:form action="/admin/account/update/${account.username}" method="post" modelAttribute="account" class="container">
            <div class="mb-3">
                <label class="form-label">Username</label>
                <form:input path="username" class="form-control" disabled="true"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <form:input path="password" class="form-control" value="${account.password}"/>
                <form:errors path="password" cssStyle="color: red"/>
            </div>
            <div class="mb-3">
                <label class="form-label">FullName</label>
                <form:input path="fullname" class="form-control" value="${account.fullname}" />
                <form:errors path="fullname" cssStyle="color: red"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <form:input path="email" class="form-control" value="${account.email}"/>
                <form:errors path="email" cssStyle="color: red"/>
            </div>
            <button class="btn btn-success" type="submit">Update</button>
        </form:form>
</main>
<footer><p style="text-align: center;">AAA</p></footer>
</body>
</html>
