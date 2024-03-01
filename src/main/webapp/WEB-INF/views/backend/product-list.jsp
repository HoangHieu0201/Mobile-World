<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${title }</title>
    
    <!-- variables -->
    <jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
     
     <!-- Custome css resource file -->
    <jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>

    
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Left sidebar -->
		<jsp:include page="/WEB-INF/views/backend/layout/left-slide-bar.jsp"></jsp:include>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Header -->
				<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>

                <!-- Begin Page Content -->
                <div class="page-wrapper">
                    <!-- ============================================================== -->
                    <!-- Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <div class="page-breadcrumb">
                        <div class="row">
                            <div class="col-7 align-self-center">
                                <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">List Product</h2>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <!-- Container fluid  -->
                    <!-- ============================================================== -->
                    <div class="container-fluid">
                        <!-- ============================================================== -->
                        <!-- Start Page Content -->
                        <!-- ============================================================== -->
                        <!-- basic table -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    
                                    <div class="card-body">
                                        <form action="${classpath }/admin/product/list" method="get">
                                            <div class="table-responsive">
                                                
                                               <div class="row">
                                                <div class="col-md-2">
                                                    <div class="form-group mb-4">
                                                        <a href="${classpath }/admin/product/add" role="button"
                                                            class="btn btn-primary">Add new product</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group mb-4">
                                                        <h3>Total products: &nbsp ${productSearch.totalItems }</h3>
                                                    </div>
                                                </div>	
                                                
                                                <div class="col-md-6">
                                                    <div class="form-group mb-4">
                                                        <label>Current page</label>
                                                        <input id="currentPage" name="currentPage" class="form-control"
                                                                value="${productSearch.currentPage }">
                                                    </div>
                                                </div>	
            
                                            </div>	
                                                <!-- Tìm kiếm -->
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div class="form-group mb-4">
                                                            <!-- 
                                                            <label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <input type="checkbox" class="form-check-input" id="status" name="status" checked="checked" />
                                                            <label for="status">Active</label>
                                                             -->
                                                            <select class="form-control"
                                                                id="status" name="status">
                                                                    <option value="2">All</option>
                                                                    <option value="1">Active</option>
                                                                    <option value="0">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-md-2">
                                                        <select class="form-control" id="categoryId" name="categoryId" style="margin-right: 10px;">
                                                            <option value="0">Select category</option>
                                                            <c:forEach items="${categories }" var="category">
                                                                <option value="${category.id }">${category.name }</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    
                                                    <div class="col-md-2">
                                                        <input class="form-control" type="date" 
                                                            id="beginDate" name="beginDate"/>		
                                                    </div>
                                                    <div class="col-md-2">
                                                        <input class="form-control"
                                                                        type="date" id="endDate" name="endDate" />		
                                                    </div>
                                                    
                                                    <div class="col-md-3">
                                                        <input type="text" class="form-control" id="keyword"
                                                                name="keyword" placeholder="Search keyword" value="${productSearch.keyword }"/>		
                                                    </div>
                                                    
                                                    <div class="col-md-1 pl-0">
                                                        <button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Find</button>
                                                    </div>
                                                </div>
                                                <!-- Hết tìm kiếm -->
                                                <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                                    <thead>
                                                        <tr align="center">
                                                            <th scope="col">No.</th>
                                                            <th scope="col">Id</th>
                                                            <th scope="col">Category</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Sale price</th>
                                                            <th scope="col">Avatar</th>
                                                            <!-- <th scope="col">Description</th>
                                                            <th scope="col">Details</th> -->
                                                            <th scope="col">Create by</th>
                                                            <th scope="col">Update by</th>
                                                            <th scope="col">Create date</th>
                                                            <th scope="col">Update date</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">Is hot</th>
                                                            <th scope="col">Seo</th>
                                                            <th scope="col">Actions</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="product" items="${products }" varStatus="loop">
                                                        <tr>
                                                            <th scope="row">${loop.index + 1 }</th>
                                                            <td>${product.id }</td>
                                                            <td>${product.category.name }</td>
                                                            <td>${product.name }</td>
                                                            <td align="right">
                                                                <fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
                                                            </td>
                                                            <td align="right">
																<fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber>
															</td>
                                                            
                                                            <td>
                                                                <img width="40px" height="40px" 
                                                                    src="${classpath }/FileUploads/${product.avatar }" class="light-logo">
                                                            </td>
                                                            
                                                           <%--  <td>${product.shortDescription }</td>
                                                            <td>${product.detailDescription }</td> --%>
                                                            <td>${product.userCreateProduct.username }</td>
                                                            <td>${product.userUpdateProduct.username }</td>
                                                            
                                                            <td>
                                                                <fmt:formatDate value="${product.createDate }" pattern="dd-MM-yyyy"/>
                                                            </td>
                                                            <td>${product.updateDate }</td>
                                                            
                                                            <td>
                                                                <span id="_product_status_${product.id }">
                                                                    <c:choose>
                                                                        <c:when test="${product.status }">
                                                                            <span>Active</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span>Inactive</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                                
                                                            </td>
                                                            <td>
                                                                <span id="_product_isHot_${product.id }">
                                                                    <c:choose>
                                                                        <c:when test="${product.isHot }">
                                                                            <span>Yes</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span>No</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                            </td>
                                                               <td>${product.seo }</td>
                                                            <td>
                                                                <a href="${classpath }/admin/product/edit/${product.id }" role="button" 
                                                                                        class="btn btn-primary">Edit</a>
                                                                <a href="${classpath }/admin/product/delete/${product.id }" role="button" 
                                                                                        class="btn btn-secondary">Delete</a>
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                    <tfoot>
                                                        <tr align="center">
                                                            <th scope="col">No.</th>
                                                            <th scope="col">Id</th>
                                                            <th scope="col">Category</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Sale price</th>
                                                            <th scope="col">Avatar</th>
                                                            <th scope="col">Description</th>
                                                            <th scope="col">Details</th>
                                                            <th scope="col">Create by</th>
                                                            <th scope="col">Update by</th>
                                                            <th scope="col">Create date</th>
                                                            <th scope="col">Update date</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">Is hot</th>
                                                            <th scope="col">Seo</th>
                                                            <th scope="col">Actions</th>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                                
                                                <div class="row">
                                                    
                                                    <%-- Phan trang --%>
                                                    <div class="col-md-12">
                                                        <div class="pagination float-right">
                                                            <div id="paging"></div>
                                                        </div>
                                                    </div>
                                                  </div>
                                            </div>	                           
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Container fluid  -->
                </div>
		        <!-- End Begin Page Content  -->
		    </div>
		    <!-- End Main Content -->

            <!-- Footer -->
            <jsp:include page="/WEB-INF/views/backend/layout/footer.jsp"></jsp:include>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="${classpath }/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Js -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

    <!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#categoryId").val(${productSearch.categoryId});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#keyword").val(${productSearch.keyword});
			
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>