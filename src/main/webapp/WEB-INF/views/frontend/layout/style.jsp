<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
		header, nav, main{
            font-family: 'Times New Roman', Times, serif;
        }
		
		header {
			background-color: darkgrey;
			justify-content: center;
			background:
				url(${classpath}/frontend/images/custom-header-hai-phat-land.png)
				no-repeat center center;
			background-size: 100% 100%;
		}
		
		/* logo */
		.rounded {
			width: 70px;
			border-radius: 18.25rem !important;
			margin-left: 10px;
		}
		

        .btn-cart{
            position: relative;
            text-decoration: none;
            display: inline-block;
            padding-right: 30px;
            margin-top: 19px;
        }

       
        .btn-cart .quantity{
            display: block;
            position: absolute;
            width: 19px;
            height: 19px;
            border-radius: 50%;
            background-color: red;
            text-align: center;
            line-height: 19px;
            color: white;
            font-size: 12px;
            top: -2px;
            left: 20px;
        }
	</style>