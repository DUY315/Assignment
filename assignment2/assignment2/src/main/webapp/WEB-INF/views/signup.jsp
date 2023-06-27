<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 6/8/2023
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<div class="bg-login">
    <div class="login-form">
        <h3>Đăng Kí Tài Khoản</h3>

        <%--@elvariable id="account" type=""--%>
        <form:form action="/signup" method="post" modelAttribute="account">
            <div class="mb-3">
                <label for="username" class="mb-4">Tên tài khoản</label>
                <form:input path="username" type="text" class="form-control" />
                <form:errors path="username" cssClass="text-danger" />
            </div>

            <div class="mb-3">
                <label for="password" class="mb-4">Mật khẩu</label>
                <form:input path="password" type="password" class="form-control" />
                <form:errors path="password" cssClass="text-danger" />
            </div>
            <div class="mb-3">
                <label for="username" class="mb-4">Full Name</label>
                <form:input path="fullname" type="text" class="form-control" />
                <form:errors path="fullname" cssClass="text-danger" />
            </div>

            <div class="mb-3">
                <label for="password" class="mb-4">Email</label>
                <form:input path="email" type="password" class="form-control" />
                <form:errors path="email" cssClass="text-danger" />
            </div>

            <div class="mb-3">
                <a href="/login" class="text-decoration-none">
                    Đăng nhập</a>
            </div>
            <button class="btn btn-primary w-100 mt-3">Đăng Kí</button>
        </form:form>
    </div>
</div>

<style>
    .bg-login {
        position: relative;
        width: 100%;
        min-height: auto;
        background-position: right 0px top 0px;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }

    .login-form {
        border: 1px solid #DDD;
        max-width: 400px;
        padding: 20px;
        margin-top: 100px;
        margin-left: auto;
        margin-right: auto;
    }
</style>