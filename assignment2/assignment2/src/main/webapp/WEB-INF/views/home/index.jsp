<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<div class="container mt-5 mb-5">
  <div class="row">
    <div class="col-3 p-3 card">
      <form >
        <div class="product-search-info mt-3">
          <label for="keyword" class="mb-1"><b>Tên sản phẩm:</b></label>
          <input name="keywords" value="${param.keywords}" class="form-control" placeholder="Nhập tên sản phẩm để tìm" />
        </div>

        <div class="brand-search-info mt-3">
          <label for="brandId"><b>Loại sản phẩm:</b></label>
          <div class="mt-2">
            <input type="radio" name="categoryId" checked value="" />
            <span>Tất cả</span>
          </div>
          <c:forEach var="c" items="${categoryList}">
              <div class="mt-1">
                <input name="categoryId" type="radio" value="${c.id}"
                    <c:if test="${param.categoryId==c.id}">checked</c:if>
                />
                <span>${c.name}</span>
              </div>
          </c:forEach>
        </div>

        <div class="price-search-info mt-3">
          <label for="priceRange"><b>Mức giá:</b></label>
          <c:forEach var="pr" items="${priceRangeList}">
            <div class="mt-2">
              <input type="radio" name="priceRangeId" value="${pr.id}"
                  <c:if test="${param.priceRangeId==pr.id}">checked</c:if>
              />
              <span>${pr.display}</span>
            </div>
          </c:forEach>
        </div>
        <button type="submit" class="btn btn-primary mt-4 mb-4">Tìm kiếm</button>
      </form>
    </div>

    <div class="col-9">
      <ul class="list-unstyled row">
        <c:forEach var="p" items="${productList.content}">
            <li class="list-item col-sm-4 mt-3">
              <div class="item-container">
                <a href="/detail/${p.id}" class="product-item">
                  <img src="${p.image}" width="100px"height="100px" class="product-image" alt="" />
                  <div class="item-info">
                    <div>
                      <span class="product-name" style="padding-left: 20px ">${p.name}</span>
                    </div>
                    <div>
                      <span class="price-title">Giá bán :</span>
                      <span class="price">${p.price} ₫</span>
                    </div>
                  </div>
                </a>
                <a href="/add-to-cart/${p.id}" class="nav-link mt-2 text-light">
                  <img alt="" style="padding-left: 25px;width:50px"
                       src="/static/images/cart.png" />
                  (${cart.total})
                </a>
              </div>
            </li>
         </c:forEach>
      </ul>
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="/?p=0">First</a></li>
          <li class="page-item" ><a class="page-link"disable="true" href="/?p=${productList.number-1}">Previous</a></li>
          <li class="page-item"><a class="page-link" href="/?p=${productList.number+1}">Next</a></li>
          <li class="page-item"><a class="page-link" href="/?p=${productList.totalPages-1}">Last</a></li>
        </ul>
      </nav>
        <li class="page-item">Tổng số sản phẩm: ${productList.totalElements}</li>
        <br/>
        <li class="page-item">Số sản phẩm hiện tại: ${productList.numberOfElements}</li>
        <br/>
        <li class="page-item">Trang số: ${productList.number}</li>
    </div>
  </div>
</div>

<style>
  .product-image {
    max-width: 95%;
    max-height: 200px;
  }

  .price-title {
    font-style: italic;
    font-size: 14px;
  }

  .price {
    font-size: 16px;
    font-weight: bold;
  }

  .product-item,
  .product-item:link,
  .product-item:hover,
  .product-item:visited {
    text-decoration: none;
    color: black;
  }

  .item-container {
    position: relative;
    height: 100%;
    padding-bottom: 50px;
  }

  .item-info {
    position: absolute;
    bottom: 0px;
    height: 50px;
  }
</style>