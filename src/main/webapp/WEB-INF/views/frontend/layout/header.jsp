<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>	


<header>
        <div class="container-fluid p-0">
            <div class="row">
                <div class="col-lg-3">
                    <img src="${classpath}/frontend/images/icon/Logo-shop.png" class="rounded float-left logo" >
                </div>
                <div class="col-lg-6 text-center storeName">
                    MOBILE WORLD
                </div>
                <div class="col-lg-3">
                    <div class="login text-right">
                        <a class="btn-cart" href="${classpath }/cart-view">
                            <span class="quantity" id="totalCartProductsId">${totalCartProducts }</span>
                            <i class="fa-solid fa-bag-shopping" style="color: aliceblue; font-size: 30px;"></i>
                        </a>
                        <a class="btn-login mr-3" href="${classpath }/login">
                            <i class="fa-regular fa-user" style="color: aliceblue; font-size: 30px;"></i>
                        </a> 
                    </div>
                </div>               
            </div>
        </div>
    </header>