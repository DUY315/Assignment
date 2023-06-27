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
<header><h2 style="text-align: center;">Quản Lý Product</h2></header>
<main>
    <%--@elvariable id="product" type=""--%>
    <form:form action="/admin /product/update/${product.id}" method="post" modelAttribute="product" class="container">
        <div class="mb-3">
            <label class="form-label">ID</label>
            <form:input path="id" class="form-control" disabled="true" value="${product.id}"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Tên sản phẩm</label>
            <form:input path="name" class="form-control" value="${product.name}"/>
            <form:errors path="name" cssStyle="color: red"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Image</label>
            <form:input path="image" class="form-control" />
            <form:errors path="image" cssStyle="color: red"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Price</label>
            <form:input path="price" class="form-control" value="${product.price}"/>
            <form:errors path="price" cssStyle="color: red"/>
        </div>
        <div class="mb-3">
            <label class="form-label">Loại Sản Phẩm</label>
            <form:select class="form-control" path="category.id">
                <form:option value="">----</form:option>
                <form:options items="${categorys}" itemLabel="name" itemValue="id"/>
            </form:select>
            <form:errors path="category.id" cssStyle="color: red"/>
        </div>
<%--        <div class="mb-3">--%>
<%--            <label class="form-label">CreateDate</label>--%>
<%--            <form:input type="date" path="createDate" class="form-control" value="${product.createDate}"/>--%>
<%--            <form:errors path="createDate" cssStyle="color: red"/>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label class="form-label">AvaiLable: </label>--%>
<%--            <form:radiobutton path="avaiLable" value="1" label="Còn hàng"--%>
<%--                              checkedValue="${product.avaiLable==1? true : false}"/>--%>
<%--            <form:radiobutton path="avaiLable" value="0" label="Hết hàng"--%>
<%--                              checkedValue="${product.avaiLable==0?true:false}"/>--%>
<%--            <br/>--%>
<%--            <form:errors path="avaiLable" cssStyle="color: red"/>--%>
<%--        </div>--%>
        <button class="btn btn-success" type="submit">UPDATE</button>
    </form:form>
</main>
<footer><p style="text-align: center;">AAA</p></footer>
</body>
</html>
