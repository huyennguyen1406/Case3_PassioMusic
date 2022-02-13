<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <title>One Music - Modern Music HTML5 Template</title>
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

    <section class="album-catagory section-padding-100-0">
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

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a1.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Cure</h5>
                            </a>
                            <p>Second Song</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item s e q">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a2.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Sam Smith</h5>
                            </a>
                            <p>Underground</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item w f r">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a3.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Will I am</h5>
                            </a>
                            <p>First</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t g u">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a4.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Cure</h5>
                            </a>
                            <p>Second Song</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item d h v">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a5.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>DJ SMITH</h5>
                            </a>
                            <p>The Album</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t i x">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a6.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Ustopable</h5>
                            </a>
                            <p>Unplugged</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item b j y">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a7.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Beyonce</h5>
                            </a>
                            <p>Songs</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item a k z">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a8.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Aam Smith</h5>
                            </a>
                            <p>Underground</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item w l number">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a9.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Will I am</h5>
                            </a>
                            <p>First</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item d m">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a10.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>DJ SMITH</h5>
                            </a>
                            <p>The Album</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t n">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a11.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Ustopable</h5>
                            </a>
                            <p>Unplugged</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album -->
                <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item b o">
                    <div class="single-album">
                        <img src="/users/img/bg-img/a12.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>Beyonce</h5>
                            </a>
                            <p>Songs</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Album Catagory Area End ##### -->

    <!-- ##### Buy Now Area Start ##### -->
    <div class="oneMusic-buy-now-area mb-100">
        <div class="container">
            <div class="row">

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="/users/img/bg-img/b1.jpg" alt="">
                            <!-- Album Price -->
                            <div class="album-price">
                                <p>$0.90</p>
                            </div>
                            <!-- Play Icon -->
                            <div class="play-icon">
                                <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>
                            </div>
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Garage Band</h5>
                            </a>
                            <p>Radio Station</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="/users/img/bg-img/b2.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Noises</h5>
                            </a>
                            <p>Buble Gum</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="/users/img/bg-img/b3.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Jess Parker</h5>
                            </a>
                            <p>The Album</p>
                        </div>
                    </div>
                </div>

                <!-- Single Album Area -->
                <div class="col-12 col-sm-6 col-md-3">
                    <div class="single-album-area">
                        <div class="album-thumb">
                            <img src="/users/img/bg-img/b4.jpg" alt="">
                        </div>
                        <div class="album-info">
                            <a href="#">
                                <h5>Noises</h5>
                            </a>
                            <p>Buble Gum</p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <div class="load-more-btn text-center">
                        <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Buy Now Area End ##### -->

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

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="/users/img/bg-img/s1.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>01. Main Hit Song</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="/users/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="/users/img/bg-img/s2.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>01. Main Hit Song</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="/users/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="/users/img/bg-img/s3.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>01. Main Hit Song</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="/users/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

                <!-- Single Song Area -->
                <div class="col-12">
                    <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                        <div class="song-thumbnail">
                            <img src="/users/img/bg-img/s4.jpg" alt="">
                        </div>
                        <div class="song-play-area">
                            <div class="song-name">
                                <p>01. Main Hit Song</p>
                            </div>
                            <audio preload="auto" controls>
                                <source src="/users/audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>

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