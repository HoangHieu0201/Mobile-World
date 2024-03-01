<!-- Sidebar menu doc-->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon">
                    <img style="width: 50px;border-radius: 50%;" src="${classpath }/backend/assets/images/Logo-shop.png" 
                    	alt="homepage"/>
                </div>
                <div class="sidebar-brand-text ml-2">Mobile World</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${classpath }/admin/home">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Administration system
            </div>

            <!-- Nav Item - category -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/admin/category/list">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Categories</span></a>
            </li>

            <!-- Nav Item - Product -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/admin/product/list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Products</span></a>
            </li>

            <!-- Nav Item - user -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/admin/user/list">
                    <i class="fa-solid fa-users"></i>
                    <span>Users</span></a>
            </li>

            <!-- Nav Item - role -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/admin/role/list">
                    <i class="fa-brands fa-critical-role"></i>
                    <span>Roles</span></a>
            </li>

            <!-- Nav Item - order -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/admin/order/list">
                    <i class="fa-solid fa-money-bills"></i>
                    <span>Orders</span></a>
            </li>

            <!-- Nav Item - contact -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/admin/contact/list">
                    <i class="fa-regular fa-address-book"></i>
                    <span>Customers' Feedback</span></a>
            </li>

			<!-- Nav Item - logout -->
            <li class="nav-item">
                <a class="nav-link" href="${classpath }/logout">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Logout</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->