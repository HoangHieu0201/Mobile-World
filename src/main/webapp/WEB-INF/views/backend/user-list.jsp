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
                                <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">List User</h2>
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
                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            
                                           <div class="row">
                                                <div class="col-md-6">
                                                <div class="form-group mb-4">
                                                    <a href="${classpath }/admin/user/add" role="button" class="btn btn-primary">Add New User</a>
                                                  </div>
                                               </div>
                                            
                                            <div class="col-md-6">
                                                <ul class="pagination float-right">
                                                    <li class="page-item disabled">
                                                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                    </li>
                                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                                    </li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item">
                                                        <a class="page-link" href="#">Next</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        
                                            <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">No.</th>
                                                        <th scope="col">Id</th>
                                                        <th scope="col">Username</th>
                                                        <th scope="col">Password</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Avatar</th>
                                                        <th scope="col">Mobile</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Address</th>
                                                        <th scope="col">Create by</th>
                                                        <th scope="col">Update by</th>
                                                        <th scope="col">Create date</th>
                                                        <th scope="col">Update date</th>
                                                        <th scope="col">Status</th> 
                                                        <th scope="col">Description</th>    
                                                        <th scope="col">Action</th>                                           
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="user" items="${users }" varStatus="loop">
                                                        <tr>
                                                            <td>${loop.index + 1 }</td>
                                                            <td>${user.id }</td>
                                                            <td>${user.username }</td>
                                                            <td>${user.password }</td>
                                                            <td>${user.name }</td>
                                                            <td>
                                                                <img width="40px" height="40px" 
                                                                    src="${classpath }/FileUploads/${user.avatar }" class="light-logo">
                                                            </td>
                                                            <td>${user.mobile }</td>
                                                            <td>${user.email }</td>
                                                            <td>${user.address }</td>
                                                            <td>${user.userCreateUser.username }</td>
                                                            <td>${user.userUpdateUser.username }</td>
                                                            <td>
                                                                <fmt:formatDate value="${user.createDate }" pattern="dd-MM-yyyy"/>
                                                            </td>
                                                            <td>
                                                                <fmt:formatDate value="${user.updateDate }" pattern="dd-MM-yyyy"/>
                                                            </td>
                                                            <td>
                                                                <span id="_user_status_${user.id }">
                                                                    <c:choose>
                                                                        <c:when test="${user.status }">
                                                                            <span>Active</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span>Inactive</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </span>
                                                            </td>
                                                            <td>${user.description }</td>
                                                            <td>
                                                                <a href="${classpath }/admin/user/edit/${user.id }" role="button" 
                                                                                        class="btn btn-primary">Edit</a>
                                                                <a href="${classpath }/admin/user/delete/${user.id }" role="button" 
                                                                                        class="btn btn-secondary">Delete</a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            
                                            <div class="row">
                                                     <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <a href="${classpath }/admin/user/add" role="button" class="btn btn-primary">Add New User</a>
                                                        </div>
                                                    </div>
                                                
                                                <div class="col-md-6">
                                                    <ul class="pagination float-right">
                                                        <li class="page-item disabled">
                                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                        </li>
                                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                                                        </li>
                                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                        <li class="page-item">
                                                            <a class="page-link" href="#">Next</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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

</body>

</html>