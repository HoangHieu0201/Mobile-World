<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="jumbotron text-center">
		<!-- cho vào box có size lớn -->
		<h1 style="color: crimson;">𝕄𝕆𝔹𝕀𝕃𝔼 𝕎𝕆ℝ𝕃𝔻</h1>
		<p>❤Uy tín chất lượng - Kết nối yêu thương❤</p>
		<form class="form-inline justify-content-center">
			<input type="text" class="form-control" size="50"
				placeholder="Nhập sản phẩm cần tìm" id="keyword" name="keyword" value="${productSearch.keyword }">
			<button type="submit" id="btnSearch" name="btnSearch"
								class="btn btn-danger">Tìm</button>
		</form>
	</div>
	
