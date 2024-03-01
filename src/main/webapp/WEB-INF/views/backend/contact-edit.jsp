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
                            <div class="col-12 align-self-center">
                                <h2
                                    class="page-title text-truncate text-dark font-weight-medium mb-1">contact
                                    Edit</h2>
                            </div>
                        </div>
                    </div>
                    
                    <!-- ============================================================== -->
                    <!-- End Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Container fluid  -->
                    <!-- ============================================================== -->
                    <div class="container-fluid">
                        <!-- ============================================================== -->
                        <!-- Start Page Content -->
                        <!-- ============================================================== -->
                        <!-- basic table -->
                        <sf:form class="form" action="${classpath }/admin/contact/edit-save" method="post" modelAttribute="contact" enctype="multipart/form-data">
                                            <div class="form-body">
                                            
                                            	<sf:hidden path="id"/> <!-- id > 0 -> Edit -->
                                            	
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="customerName">Customer Name</label>
                                                            <sf:input path="name" type="text" class="form-control" id="customerName" name="customerName" placeholder=" name"></sf:input>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="customerMobile">Customer Mobile</label>
                                                            <sf:input path="mobile" type="text" class="form-control" id="customerMobile" name="customerMobile" placeholder="mobile"></sf:input>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="customerEmail">Customer Email</label>
                                                            <sf:input path="email" type="text" class="form-control" id="customerEmail" name="customerEmail" placeholder=" email"></sf:input>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="customerAddress">Customer Address</label>
                                                            <sf:input path="address" type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="address"></sf:input>
                                                        </div>
                                                    </div>
                                                </div>
                                               
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="createDate">Create date</label>
                                                            
                                                            <sf:input path="createDate" class="form-control" type="date" 
                                                                        id="createDate" name="createDate"></sf:input>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="updateDate">Update date</label>
                                                        
                                                            <sf:input path="updateDate" class="form-control" type="date" 
                                                                        id="updateDate" name="updateDate"></sf:input>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                 <div class="row">
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-4">
                                                            <label for="customerMessage">Customer Message</label>
                                                            <sf:input path="message" type="text" class="form-control" id="customerMessage" 
                                                            			name="customerMessage" placeholder=" message" readonly="true"></sf:input>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                               <div class="row">
													<div class="col-md-10">
														<div class="form-group mb-4">
															<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<sf:checkbox path="status" class="form-check-input"
																id="status" name="status"></sf:checkbox>
															<label for="status">Đã xử lý</label>
														</div>
													</div>
												</div> 
												
												<%-- <div class="row">
													<div class="col-md-10">
														<div class="form-group mb-4">
															<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<sf:select path="delivery" class="form-check-input"
																id="delivery" name="delivery">
																<option value="DELIVERED">Đã giao hàng</option>
																<option value="NOT_DELIVERED">Chưa giao hàng</option>
																<option value="DELETED">Đã xoá</option>
																<option value="DELIVERING">Đang giao hàng</option>
															</sf:select>
															<!-- <label for="status">Đã giao hàng</label> -->
														</div>
													</div>

												</div> --%>
                                                
                                                
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group mb-4">
                                                            <a href="${classpath }/admin/contact/list" class="btn btn-secondary active" role="button" aria-pressed="true">
                                                                Back to list
                                                            </a>
                                                            <button type="submit" class="btn btn-primary">Save edit contact</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </sf:form>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Container fluid  -->
                </div>
                <!-- ============================================================== -->
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
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Js -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

    <script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${searchModel.status});
			
			$("#paging").pagination({
				currentPage: ${searchModel.currentPage}, //Trang hien tai
				items: ${searchModel.totalItems}, //Tong so don hang (total sale contacts)
				itemsOnPage: ${searchModel.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#page').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>