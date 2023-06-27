<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/2/2023
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/1/2023
  Time: 6:39 PM
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
<header><h2 style="text-align: center;">Quản Lý Category</h2></header>
<main>
    <%--@elvariable id="category" type=""--%>
    <form:form action="/admin/category/add" method="post" modelAttribute="category" class="container">
        <div class="mb-3">
            <label class="form-label">ID</label>
            <form:input path="id" class="form-control" />
            <form:errors path="id" cssStyle="color: red"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Tên</label>
            <form:input path="name" class="form-control" />
            <form:errors path="name" cssStyle="color: red"/>
        </div>
        <button class="btn btn-success" type="submit">Add</button>
    </form:form>
</main>
<footer><p style="text-align: center;">AAA</p></footer>
</body>
</html>
