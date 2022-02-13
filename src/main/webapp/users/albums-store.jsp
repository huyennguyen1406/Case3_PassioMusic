<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <title>Your Playlist</title>
    <meta charset="UTF-8">
    <link rel="icon" href="/users/img/core-img/favicon.ico">
    <link rel="stylesheet" href="/users/style.css">

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <header class="header-area">
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <a href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}" class="nav-brand"><img src="/users/img/core-img/logo.png" alt=""></a>

                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <div class="classy-menu">
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}">Home</a></li>
                                    <li><a href="/home?action=getPlaylist&idUser=${id}&userName=${userName}&password=${password}">Playlist</a></li>
                                    <li><a href="/home?action=getContact&idUser=${id}&userName=${userName}&password=${password}">Liên hệ</a></li>
                                </ul>
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn mr-50">
                                        <a href="#" id="loginBtn">Hi ${user.getNameUser()}</a>
                                    </div>

                                    <!-- Cart Button -->
                                    <div class="cart-btn">
                                        <a href="/home?action=getCart&idUser=${id}"><p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p></a>
                                    </div>
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(/users/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>Chiếm lấy bọn em đi anh chị</p>
            <h2>HOT HOT HOTTT</h2>
        </div>
    </section>

    <section class="album-category section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="browse-by-catagories catagory-menu d-flex flex-wrap align-items-center mb-70">
                        <a href="#" data-filter="*">Browse All</a>
                        <a href="#" data-filter=".a" class="active">A</a>
                        <a href="#" data-filter=".b">B</a>
                        <a href="#" data-filter=".c">C</a>
                        <a href="#" data-filter=".d">D</a>
                        <a href="#" data-filter=".e">E</a>
                        <a href="#" data-filter=".f">F</a>
                        <a href="#" data-filter=".g">G</a>
                        <a href="#" data-filter=".h">H</a>
                        <a href="#" data-filter=".i">I</a>
                        <a href="#" data-filter=".j">J</a>
                        <a href="#" data-filter=".k">K</a>
                        <a href="#" data-filter=".l">L</a>
                        <a href="#" data-filter=".m">M</a>
                        <a href="#" data-filter=".n">N</a>
                        <a href="#" data-filter=".o">O</a>
                        <a href="#" data-filter=".p">P</a>
                        <a href="#" data-filter=".q">Q</a>
                        <a href="#" data-filter=".r">R</a>
                        <a href="#" data-filter=".s">S</a>
                        <a href="#" data-filter=".t">T</a>
                        <a href="#" data-filter=".u">U</a>
                        <a href="#" data-filter=".v">V</a>
                        <a href="#" data-filter=".w">W</a>
                        <a href="#" data-filter=".x">X</a>
                        <a href="#" data-filter=".y">Y</a>
                        <a href="#" data-filter=".z">Z</a>
                        <a href="#" data-filter=".number">0-9</a>
                    </div>
                </div>
            </div>

            <div class="row oneMusic-albums">
                <c:forEach items="${songOwns}" var="songOwn">
                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="${songOwn.getSong().getLinkImg()}" alt="nothing to show">
                        <div class="album-info">
                            <a href="#">
                                <h5>${songOwn.getSong().getNameSong()}</h5>
                            </a>
                            <p>${songOwn.getNameSinger()}</p>
                        </div>
                    </div>
                </div>
                </c:forEach>

            </div>
        </div>
    </section>
    <!-- ##### Album Catagory Area End ##### -->

    <!-- ##### Add Area Start ##### -->
    <div class="add-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="adds">
                        <a href="#"><img src="/users/img/bg-img/add3.gif" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Add Area End ##### -->

    <!-- ##### Song Area Start ##### -->
    <div class="one-music-songs-area mb-70">
        <div class="container">
            <div class="row">
                <c:forEach items="${songOwns}" var="songOwn">
                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="${songOwn.getSong().getLinkImg()}" alt="no thing to show">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>${songOwn.getSong().getNameSong()}</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="${songOwn.getSong().getLinkSong()}">
                            </audio>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- ##### Song Area End ##### -->


    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="/users/img/core-img/logo.png" alt=""></a>
                    <p class="copywrite-text">
                        Power By Mood Group With Luv <3</p>
                </div>
            </div>
        </div>
    </footer>
    <script src="/users/js/jquery/jquery-2.2.4.min.js"></script>
    <script src="/users/js/bootstrap/popper.min.js"></script>
    <script src="/users/js/bootstrap/bootstrap.min.js"></script>
    <script src="/users/js/plugins/plugins.js"></script>
    <script src="/users/js/active.js"></script>
</body>

</html>