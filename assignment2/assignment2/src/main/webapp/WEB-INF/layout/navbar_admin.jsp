<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-secondary p-0">
  <div class="navbar-nav collapse navbar-collapse">
    <a class="nav-item nav-link" href="/">Trang chủ</a>
    <a class="nav-item nav-link" href="/admin/category/hien-thi">Quản lý nhóm sản phẩm</a>
    <a class="nav-item nav-link" href="/admin/product/hien-thi">Quản lý sản phẩm</a>
    <a class="nav-item nav-link" href="/admin/account/hien-thi">Quản lý tài khoản</a>
    <a class="nav-item nav-link" href="/admin/cart/hien-thi">Quản lý đơn hàng</a>
  </div>

  <ul class="navbar-nav ml-auto">
    <li class="nav-item no-arrow">
      <c:if test="${cart.total > 0}">
        <a href="/cart" class="nav-link mt-2 text-light">
          <img alt="" style="width:40px"
               src="/static/images/cart.png" />
          (${cart.total})
        </a>
      </c:if>
    </li>
    <li class="nav-item no-arrow">
      <a class="nav-link  p-0" data-bs-toggle="dropdown" href="#">
        <img alt="" class="rounded-circle" style="width:60px"
          src="/static/images/user.svg" />
      </a>
      <div class="dropdown-menu dropdown-menu-end">
        <a class="dropdown-item" value="${sessionScope.username}"  href="/logout" />
        Đăng xuất (${sessionScope.username})
        </a>
      </div>
    </li>
  </ul>
</nav>