<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10-Feb-22
  Time: 9:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <title>Admin Management</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/"/>

    <link rel="icon" type="image/png" sizes="16x16" href="/admins/plugins/images/favicon.png">

    <link href="/admins/plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/admins/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">

    <link href="/admins/css/style.min.css" rel="stylesheet">
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

                <a class="navbar-brand" href="/home?action=checkLoginAndRole&userName=${admin.getUserName()}&password=${admin.getPassword()}">

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

                <ul class="navbar-nav ms-auto d-flex align-items-center">

                    <li>
                        <a class="profile-pic" href="/home">
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
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/home?action=checkLoginAndRole&userName=${admin.getUserName()}&password=${admin.getPassword()}"
                           aria-expanded="false">
                            <i class="far fa-clock" aria-hidden="true"></i>
                            <span class="hide-menu">Dashboard</span>
                        </a>
                    </li>
<%--                    <li class="sidebar-item">--%>
<%--                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/admins/profile.jsp"--%>
<%--                           aria-expanded="false">--%>
<%--                            <i class="fa fa-user" aria-hidden="true"></i>--%>
<%--                            <span class="hide-menu">Profile</span>--%>
<%--                        </a>--%>
<%--                    </li>--%>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link" href="/homes?action=getInfoAccount&idAdmin=${admin.getId()}";
                           aria-expanded="false">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span class="hide-menu">Basic Table</span>
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
                    <h4 class="page-title">Dashboard</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-12">
                    <div class="white-box analytics-info">
                        <h3 class="box-title">Total Singers</h3>
                        <ul class="list-inline two-part d-flex align-items-center mb-0">
                            <li>
                                <div id="sparklinedash">
                                    <canvas width="67" height="30"
                                            style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                </div>
                            </li>
                            <li class="ms-auto"><span class="counter text-success">${totalSinger}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="white-box analytics-info">
                        <h3 class="box-title">Total Users</h3>
                        <ul class="list-inline two-part d-flex align-items-center mb-0">
                            <li>
                                <div id="sparklinedash2">
                                    <canvas width="67" height="30"
                                            style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                </div>
                            </li>
                            <li class="ms-auto"><span class="counter text-purple">${totalUser}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="white-box analytics-info">
                        <h3 class="box-title">Total Revenue</h3>
                        <ul class="list-inline two-part d-flex align-items-center mb-0">
                            <li>
                                <div id="sparklinedash3">
                                    <canvas width="67" height="30"
                                            style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                </div>
                            </li>
                            <li class="ms-auto"><span class="counter text-info">${revenue}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="white-box">
                        <div class="d-md-flex mb-3">
                            <h3 class="box-title mb-0">Singer List</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap">
                                <thead>
                                <tr>
                                    <th class="border-top-0">No</th>
                                    <th class="border-top-0">Singer Name</th>
                                    <th class="border-top-0">Phone Number</th>
                                    <th class="border-top-0">Email</th>
                                    <th class="border-top-0">Revenue</th>
                                    <th class="border-top-0">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${singerByRevenue}" var="singer">
                                    <tr>
                                        <td class="txt-oflo"></td>
                                        <td class="txt-oflo">${singer.getSinger().getNameSinger()}</td>
                                        <td class="txt-oflo">${singer.getSinger().getPhoneNumber()}</td>
                                        <td class="txt-oflo">${singer.getSinger().getEmail()}</td>
                                        <td class="txt-oflo">${singer.getRevenue()}</td>
                                        <td class="txt-oflo"><a
                                                href="/home?action=deleteSinger&idAdmin=${admin.getId()}&idSinger=${singer.getSinger().getId()}">DELETE</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="white-box">
                        <div class="d-md-flex mb-3">
                            <h3 class="box-title mb-0">User List</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap">
                                <thead>
                                <tr>
                                    <th class="border-top-0">No</th>
                                    <th class="border-top-0">User Name</th>
                                    <th class="border-top-0">Phone Number</th>
                                    <th class="border-top-0">Email</th>
                                    <th class="border-top-0">Address</th>
                                    <th class="border-top-0">Cash</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${userByRevenue}" var="user">
                                    <tr>
                                        <td class="txt-oflo"></td>
                                        <td class="txt-oflo">${user.getUser().getNameUser()}</td>
                                        <td class="txt-oflo">${user.getUser().getPhoneNumber()}</td>
                                        <td class="txt-oflo">${user.getUser().getEmail()}</td>
                                        <td class="txt-oflo">${user.getUser().getAddress()}</td>
                                        <td class="txt-oflo">${user.getRevenue()}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer text-center"> Power by Mood Group with luv</footer>

        </div>
    </div>
</div>
<script src="/admins/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/admins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/admins/js/app-style-switcher.js"></script>
<script src="/admins/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="/admins/js/waves.js"></script>
<script src="/admins/js/sidebarmenu.js"></script>
<script src="/admins/js/custom.js"></script>
<script src="/admins/plugins/bower_components/chartist/dist/chartist.min.js"></script>
<script src="/admins/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
<script src="/admins/js/pages/dashboards/dashboard1.js"></script>
</body>
</html>