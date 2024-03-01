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
                                <h2 class="page-title text-truncate text-dark font-weight-medium mb-1">Add Category</h2>
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
                                        <sf:form class="form" action="${classpath }/admin/role/add-save" method="post" modelAttribute="role" enctype="multipart/form-data">
                                             <div class="form-body">
                                                <div class="row">
                                                    
                                                     <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="name">Role name</label>
                                                            <sf:input path="name" type="text" class="form-control" id="name" name="name" placeholder="role name"></sf:input>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                     <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="role">Create by</label>
                                                            <sf:select path="userCreateRole.id" class="form-control" id="userCreateRole">
                                                                <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
                                                            </sf:select>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="role">Update by</label>
                                                            <sf:select path="userUpdateRole.id" class="form-control" id="userUpdateRole">
                                                                <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
                                                            </sf:select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                     <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="createdate">Create date</label>
                                                            
                                                            <sf:input path="createDate" class="form-control" type="date" 
                                                                        id="createDate" name="createDate"></sf:input>
                                                        </div>
                                                    </div>
                                            
                                                    <div class="col-md-6">
                                                        <div class="form-group mb-4">
                                                            <label for="updatedate">Update date</label>
                                                           
                                                            <sf:input path="updateDate" class="form-control" type="date" 
                                                                        id="updateDate" name="updateDate"></sf:input>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                     <div class="col-md-12">
                                                        <div class="form-group mb-4">
                                                            <label for="description">Description</label>
                                                            <sf:textarea path="description" id="description" name="description"
                                                                        class="form-control" rows="3" placeholder="desription..."></sf:textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    
                                                    <div class="col-md-10">
                                                        <div class="form-group mb-4">
                                                            <label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                            <sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
                                                            <label for="status">Active</label>			                                       
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                
                                                
                                                <div class="row">
                                                     <div class="col-md-12">
                                                        <div class="form-group mb-4">
                                                            <a href="${classpath }/admin/role/list" class="btn btn-secondary active" role="button" aria-pressed="true">
                                                                Back to list
                                                            </a>
                                                            <button type="submit" class="btn btn-primary">Save role</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </sf:form>
                                    </div>
                                </div>    
                          </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Container fluid  -->
                </div>
                <!-- ============================================================== -->
                <!-- End Page wrapper  -->
                <!-- ============================================================== -->
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
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Js -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

</body>

</html>