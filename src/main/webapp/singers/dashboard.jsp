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
    <title>Singer Management</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/"/>

    <link rel="icon" type="image/png" sizes="16x16" href="/singers/plugins/images/favicon.png">

    <link href="/singers/plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet"
          href="/singers/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">

    <link href="/singers/css/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/singers/css/popup.css">
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

                <a class="navbar-brand" href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}">
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

                <ul class="navbar-nav ms-auto d-flex align-items-center">

                    <li>
                        <a class="profile-pic"
                           href="/home?action=getProfileSinger&idSinger=${singer.getId()}&userName=${userName}&password=${password}">
                            <img src="/singers/plugins/images/users/varun.jpg" alt="user-img" width="36"
                                 class="img-circle"><span
                                class="text-white font-medium">${singer.getNameSinger()}</span></a>
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
                           href="/home?action=getProfileSinger&idSinger=${singer.getId()}&userName=${userName}&password=${password}"
                           ;
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
                    <h4 class="page-title">Analyst Dashboard</h4>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-12">
                    <div class="white-box analytics-info">
                        <h3 class="box-title">Total Song</h3>
                        <ul class="list-inline two-part d-flex align-items-center mb-0">
                            <li>
                                <div id="sparklinedash">
                                    <canvas width="67" height="30"
                                            style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                </div>
                            </li>
                            <li class="ms-auto"><span class="counter text-success">${totalSong}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12">
                    <div class="white-box analytics-info">
                        <h3 class="box-title">Total Revenue</h3>
                        <ul class="list-inline two-part d-flex align-items-center mb-0">
                            <li>
                                <div id="sparklinedash3">
                                    <canvas width="67" height="30"
                                            style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                </div>
                            </li>
                            <li class="ms-auto"><span class="counter text-info">${totalRevenue}</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="white-box">
                        <div class="d-md-flex mb-3">
                            <h3 class="box-title mb-0">Song List</h3>
                        </div>
                        <div class="table-responsive">
                            <table class="table no-wrap">
                                <thead>
                                <tr>
                                    <th class="border-top-0">No</th>
                                    <th class="border-top-0">Song Name</th>
                                    <th class="border-top-0">Download</th>
                                    <th class="border-top-0">Price</th>
                                    <th class="border-top-0">Revenue</th>
                                    <th class="border-top-0">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${songByDownloads}" var="song">
                                    <c:if test="${song.getSong().getPrice()!=0}">
                                        <tr>
                                            <td class="txt-oflo">${song.getSong().getId()}</td>
                                            <td class="txt-oflo">${song.getSong().getNameSong()}</td>
                                            <td class="txt-oflo">${song.getNumberOfDownload()}</td>
                                            <td class="txt-oflo">${song.getSong().getPrice()}</td>
                                            <td class="txt-oflo">${song.getSong().getPrice()*song.getNumberOfDownload()}</td>
                                            <td class="txt-oflo"><a
                                                    href="/home?action=deleteSong&idSinger=${singer.getId()}&userName=${userName}&password=${password}&idSong=${song.getSong().getId()}">DELETE</a>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <p>
                <button class="button" data-modal="modalOne">Create New Song</button>
            </p>
            <div id="modalOne" class="modal">
                <div class="modal-content">
                    <div class="contact-form">
                        <a class="close">&times;</a>
                        <form action="/home?action=createNewSong&idSinger=${singer.getId()}&userName=${userName}&password=${password}" method="post">
                            <h2>Create New Song</h2>
                            <div>
                                <input type="text" name="song_name" placeholder="Song name"/>
                                <input type="text" name="song_link" placeholder="Link to upload"/>
                                <input type="text" name="song_img" placeholder="Link Song Image"/>
                                <input type="text" name="price" placeholder="Price to deal"/>
                            </div>
                            <button type="submit" href="/">Upload</button>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                let modalBtns = [...document.querySelectorAll(".button")];
                modalBtns.forEach(function (btn) {
                    btn.onclick = function () {
                        let modal = btn.getAttribute("data-modal");
                        document.getElementById(modal).style.display = "block";
                    };
                });
                let closeBtns = [...document.querySelectorAll(".close")];
                closeBtns.forEach(function (btn) {
                    btn.onclick = function () {
                        let modal = btn.closest(".modal");
                        modal.style.display = "none";
                    };
                });
                window.onclick = function (event) {
                    if (event.target.className === "modal") {
                        event.target.style.display = "none";
                    }
                };
            </script>
            <footer class="footer text-center"> Power by Mood Group with luv</footer>

        </div>
    </div>
</div>
<script src="/singers/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<script src="/singers/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/singers/js/app-style-switcher.js"></script>
<script src="/singers/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
<script src="/singers/js/waves.js"></script>
<script src="/singers/js/sidebarmenu.js"></script>
<script src="/singers/js/custom.js"></script>
<script src="/singers/plugins/bower_components/chartist/dist/chartist.min.js"></script>
<script src="/singers/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
<script src="/singers/js/pages/dashboards/dashboard1.js"></script>
</body>
</html>