<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
    <title>${nameSinger} Profile</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/"/>
    <link rel="icon" type="image/png" sizes="16x16" href="/singers/plugins/images/favicon.png">
    <link href="/singers/css/style.min.css" rel="stylesheet">
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
                <a class="navbar-brand" href="/home?action=getProfileSinger&idSinger=${id}">
                    <b class="logo-icon">
                        <img src="/singers/plugins/images/logo-icon.png" alt="homepage"/>
                    </b>
                    <span class="logo-text">
                            <img src="/singers/plugins/images/logo-text.png" alt="homepage"/>
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
                        <a class="profile-pic" href="/home?action=getProfileSinger&idSinger=${id}">
                            <img src="/singers/plugins/images/users/varun.jpg" alt="user-img" width="36"
                                 class="img-circle"><span class="text-white font-medium">${nameSinger}</span></a>
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
                           href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}"
                           aria-expanded="false">
                            <i class="far fa-clock" aria-hidden="true"></i>
                            <span class="hide-menu">Analyst</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link waves-effect waves-dark sidebar-link"
                           href="/home?action=getProfileSinger&idSinger=${id}&userName=${userName}&password=${password}"
                           aria-expanded="false">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span class="hide-menu">Profile</span>
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
                    <h4 class="page-title">Profile</h4>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-xlg-3 col-md-12">
                    <div class="white-box">
                        <div class="user-bg"><img width="100%" alt="user" src="/singers/plugins/images/large/img1.jpg">
                            <div class="overlay-box">
                                <div class="user-content">
                                    <a href="javascript:void(0)"><img src="/singers/plugins/images/users/genu.jpg"
                                                                      class="thumb-lg img-circle" alt="img"></a>
                                    <h4 class="text-white mt-2">${nameSinger}</h4>
                                    <h5 class="text-white mt-2">${email}</h5>
                                </div>
                            </div>
                        </div>
                        <div class="user-btm-box mt-5 d-md-flex">
                        </div>
                    </div>
                </div>

                <div class="col-lg-8 col-xlg-9 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="form-horizontal form-material">
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Full Name</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" name="nameSinger" value="${nameSinger}"
                                               class="form-control p-0 border-0"></div>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="example-email" class="col-md-12 p-0">Email</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="email" name="email" value="${email}"
                                               class="form-control p-0 border-0" name="example-email"
                                               id="example-email">
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Phone Number</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" name="phoneNumber" value="${phoneNumber}"
                                               class="form-control p-0 border-0">
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Address</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <input type="text" name="address" value="${address}"
                                               class="form-control p-0 border-0">
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="col-md-12 p-0">Message</label>
                                    <div class="col-md-12 border-bottom p-0">
                                        <textarea rows="5" class="form-control p-0 border-0"></textarea>
                                    </div>
                                </div>
                            </form>
                            <div class="form-group mb-4">
                                <div class="col-sm-12">
                                    <button onclick="location.href='/home?action=updateSingerInformation&idSinger=${id}&userName=${userName}&password=${password}'"
                                            class="btn btn-success"><b>Update Profile</b></button>&emsp;
                                    <button onclick="location.href='/home'" class="btn btn-danger"><b> Logout </b>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer text-center"> Power by Mood Group with luv</footer>
    </div>
</div>

<script src="/singers/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/singers/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/singers/js/app-style-switcher.js"></script>
<script src="/singers/js/waves.js"></script>
<script src="/singers/js/sidebarmenu.js"></script>
<script src="/singers/js/custom.js"></script>
</body>
</html>