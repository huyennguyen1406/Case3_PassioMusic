<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <title>Account Table</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/"/>
    <link rel="icon" type="image/png" sizes="16x16" href="/admins/plugins/images/favicon.png">
    <link href="/admins/css/style.min.css" rel="stylesheet">
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
</head>

<body>
<div class="preloader">
    <div class="lds-ripple">
        <div class="lds-pos"></div>
        <div class="lds-pos"></div>
    </div>
</div>
<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
     data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
    <header class="topbar" data-navbarbg="skin5">
        <nav class="navbar top-navbar navbar-expand-md navbar-dark">
            <div class="navbar-header" data-logobg="skin6">
                <a class="navbar-brand"
                   href="/home?action=checkLoginAndRole&userName=${admin.getUserName()}&password=${admin.getPassword()}">
                    <b class="logo-icon">
                        <img src="/admins/plugins/images/logo-icon.png" alt="homepage"/>
                    </b>
                    <span class="logo-text">
                            <img src="/admins/plugins/images/logo-text.png" alt="homepage"/>
                        </span>
                </a>
                <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                   href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </div>
            <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                <ul class="navbar-nav d-none d-md-block d-lg-none">
                    <li class="nav-item">
                        <a class="nav-toggler nav-link waves-effect waves-light text-white"
                           href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto d-flex align-items-center">
                    <li>
                        <a class="profile-pic"
                           href="/home?action=checkLoginAndRole&userName=${admin.getUserName()}&password=${admin.getPassword()}">
                            <img src="/admins/plugins/images/users/varun.jpg" alt="user-img" width="36"
                                 class="img-circle"><span
                                class="text-white font-medium">${admin.getUserName()}</span></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <aside class="left-sidebar" data-sidebarbg="skin6">
        <div class="scroll-sidebar">
            <nav class="sidebar-nav">
                <ul id="sidebarnav">
                    <li class="sidebar-item pt-2">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                           href="/home?action=checkLoginAndRole&userName=${admin.getUserName()}&password=${admin.getPassword()}"
                           aria-expanded="false">
                            <i class="far fa-clock" aria-hidden="true"></i>
                            <span class="hide-menu">Dashboard</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                           href="/home?action=getInfoAccount&idAdmin=${admin.getId()}"
                           aria-expanded="false">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span class="hide-menu">Account Table</span>
                        </a>
                    </li>
                </ul>

            </nav>
        </div>
    </aside>
    <div class="page-wrapper">
        <div class="page-breadcrumb bg-white">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Basic Table</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <h3 class="box-title">Basic Table</h3>
                        <div class="table-responsive">
                            <table class="table text-nowrap">
                                <thead>
                                <tr>
                                    <th class="border-top-0">ID</th>
                                    <th class="border-top-0">UserName</th>
                                    <th class="border-top-0">Password</th>
                                    <th class="border-top-0">Role Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${accountRoleNames}" var="accountRoleName">
                                    <tr>
                                            <%--                                        <td><img src="https://i.ytimg.com/vi/X-yIEMduRXk/maxresdefault.jpg" alt=""></td>--%>
<%--                                        <td>--%>
                                                    <%--                                            <audio src="https://tainhac123.com/listen/moi-anh-vao-team-em-chi-pu.YcCGtMPesr4D.html"--%>
                                                    <%--                                                   controls>--%>
                                                    <%--                                            </audio>--%>
                                                    <%--                                        </td>--%>
                                        <td>${accountRoleName.getAccount().getId()}</td>
                                        <td>${accountRoleName.getAccount().getUserName()}</td>
                                        <td>${accountRoleName.getAccount().getPassword()}</td>
                                        <td>${accountRoleName.getRoleName()}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center"> Power by Mood Group with luv <3</footer>
    </div>
</div>
<script src="/admins/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/admins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/admins/js/app-style-switcher.js"></script>
<script src="/admins/js/waves.js"></script>
<script src="/admins/js/sidebarmenu.js"></script>
<script src="/admins/js/custom.js"></script>
</body>
</html>