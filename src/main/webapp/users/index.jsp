<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Passio's Corner - From Mood team with luv <3</title>
    <link rel="icon" href="/users/img/core-img/favicon.ico">
    <link rel="stylesheet" href="/users/style.css">
</head>

<body>
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
                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                    <!-- Ảnh nền cần thay -->
                    <a href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}" class="nav-brand"><img src="/users/img/core-img/logo.png" alt=""></a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <!-- Menu -->
                    <div class="classy-menu">

                        <!-- Close Button -->
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

                            <!-- Đổi sang tên người dùng, bấm vào để logout -->
                            <div class="login-register-cart-button d-flex align-items-center">
                                <div class="login-register-btn mr-50">
                                    <a href="#" id="loginBtn">Hi ${user.getNameUser()}</a>
                                </div>

                                <!-- Cart Button chuyển sang cart.jsp nhớ lưu idUser -->
                                <div class="cart-btn">
                                    <a href="/home?action=getCart&idUser=${id}"><p><span class="icon-shopping-cart"></span> <span class="quantity">1</span></p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
<section class="hero-area">
    <div class="hero-slides owl-carousel">
        <!-- Single Hero Slide -->
        <div class="single-hero-slide d-flex align-items-center justify-content-center">
            <!-- Slide Img -->
            <div class="slide-img bg-img" style="background-image: url(/users/img/bg-img/bg-1.jpg);"></div>
            <!-- Slide Content -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-slides-content text-center">
                            <h6 data-animation="fadeInUp" data-delay="100ms">Đẹp chưa anh em</h6>
                            <h2 data-animation="fadeInUp" data-delay="300ms">Nhấp nháy này <span>Nhấp nháy này</span>
                            </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Single Hero Slide -->
        <div class="single-hero-slide d-flex align-items-center justify-content-center">
            <!-- Slide Img -->
            <div class="slide-img bg-img" style="background-image: url(/users/img/bg-img/bg-2.jpg);"></div>
            <!-- Slide Content -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="hero-slides-content text-center">
                            <h6 data-animation="fadeInUp" data-delay="100ms">Làm cái nữa nhá</h6>
                            <h2 data-animation="fadeInUp" data-delay="300ms">Nhấp nháy nữa này
                                <span>Nhấp nháy nữa này</span></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="latest-albums-area section-padding-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-heading style-2">
                    <!--                        <p>Typical song</p>-->
                    <h2>Mua rồi thì thỏa sức nghe thôi</h2>
                </div>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-12 col-lg-9">
                <div class="ablums-text text-center mb-70">
                    <p>Ở đây muốn nghe thì phải mua. Còn cái loại xem chùa nghe chùa thì lên ZingMp3 nhé. Chấm mút!!!
                        Mấy bài dưới hay lắm, bấm vào mà nghe thử, cái nào mua rồi thì kéo xuống dưới tiếp nhé</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="albums-slideshow owl-carousel">
                    <c:forEach items="${songOwns}" var="songOwn">
                        <div class="single-album">
                            <img src="${songOwn.getSong().getLinkImg()}" alt="nothing to show">
                            <div class="album-info">
                                <a href="#">
                                    <h5>${songOwn.getSong().getNameSong()}</h5>
                                </a>
                                <p>${songOwn.getNameSinger()}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="section-heading style-2">
                    <h2>Những bài bạn chưa có điều kiện để mua</h2>
                </div>
            </div>
        </div>

        <div class="row">

            <!-- Single Album Area -->
            <c:forEach items="${songNotOwns}" var="songNotOwn">
                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
                    <div class="single-album-area wow fadeInUp" data-wow-delay="100ms">
                        <div class="album-thumb">
                            <img src="${songNotOwn.getSong().getLinkImg()}" alt="nothing to show">
                            <!-- Album Price -->
                            <div class="album-price">
                                <p>${songNotOwn.getSong().getPrice()} $</p>
                            </div>
                            <!-- Play Icon -->
<%--                            <div class="play-icon">--%>
<%--                                <a href="/update-information/update-information.jsp" class="video--play--btn"><span class="icon-play-button"></span></a>--%>
<%--                            </div>--%>
                        </div>
                        <div class="album-info">
                            <a href="/home?action=getSongDetail&idSong=${songNotOwn.getSong().getId()}&userName=${userName}&password=${password}">
                                <h5>${songNotOwn.getSong().getNameSong()}</h5>
                            </a>
                            <p>${songNotOwn.getNameSinger()}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <!--Đoạn loadmore thì sẽ nhảy sang playlist-->
        <div class="row">
            <div class="col-12">
                <div class="load-more-btn text-center wow fadeInUp" data-wow-delay="300ms">
                    <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Buy Now Area End ##### -->

<!-- ##### Featured Artist Area Start ##### -->
<section class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed"
         style="background-image: url(img/bg-img/bg-4.jpg);">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-12 col-md-5 col-lg-4">
                <div class="featured-artist-thumb">
                    <img src="/users/img/bg-img/fa.jpg" alt="">
                </div>
            </div>
            <div class="col-12 col-md-7 col-lg-8">
                <div class="featured-artist-content">
                    <!-- Section Heading -->
                    <div class="section-heading white text-left mb-30">
                        <p>What’s new</p>
                        <h2>Amazing Sound Ever</h2>
                    </div>
                    <p>Trải nghiệm âm thanh chửi như hát của vợ bạn Đức.</p>
                    <div class="song-play-area">
                        <div class="song-name">
                            <p>01. Lời mở đầu</p>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="miscellaneous-area section-padding-100-0">
    <div class="container">
        <div class="row">
            <!-- ***** Weeks Top ***** -->
            <div class="col-12 col-lg-4">
                <div class="weeks-top-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>This week’s top</h2>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/wt1.jpg" alt="">
                        </div>
                        <div class="content-">
                            <h6>Sam Smith</h6>
                            <p>Underground</p>
                        </div>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="150ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/wt2.jpg" alt="">
                        </div>
                        <div class="content-">
                            <h6>Power Play</h6>
                            <p>In my mind</p>
                        </div>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="200ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/wt3.jpg" alt="">
                        </div>
                        <div class="content-">
                            <h6>Cristinne Smith</h6>
                            <p>My Music</p>
                        </div>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="250ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/wt4.jpg" alt="">
                        </div>
                        <div class="content-">
                            <h6>The Music Band</h6>
                            <p>Underground</p>
                        </div>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="300ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/wt5.jpg" alt="">
                        </div>
                        <div class="content-">
                            <h6>Creative Lyrics</h6>
                            <p>Songs and stuff</p>
                        </div>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="350ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/wt6.jpg" alt="">
                        </div>
                        <div class="content-">
                            <h6>The Culture</h6>
                            <p>Pop Songs</p>
                        </div>
                    </div>

                </div>
            </div>

            <!-- ***** New Hits Songs ***** -->
            <div class="col-12 col-lg-4">
                <div class="new-hits-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>New Hits</h2>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="100ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="/users/img/bg-img/wt7.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Sam Smith</h6>
                                <p>Underground</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="150ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="/users/img/bg-img/wt8.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Power Play</h6>
                                <p>In my mind</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="200ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="/users/img/bg-img/wt9.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Cristinne Smith</h6>
                                <p>My Music</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="250ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="/users/img/bg-img/wt10.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>The Music Band</h6>
                                <p>Underground</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="300ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="/users/img/bg-img/wt11.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>Creative Lyrics</h6>
                                <p>Songs and stuff</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>

                    <!-- Single Top Item -->
                    <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp"
                         data-wow-delay="350ms">
                        <div class="first-part d-flex align-items-center">
                            <div class="thumbnail">
                                <img src="/users/img/bg-img/wt12.jpg" alt="">
                            </div>
                            <div class="content-">
                                <h6>The Culture</h6>
                                <p>Pop Songs</p>
                            </div>
                        </div>
                        <audio preload="auto" controls>
                            <source src="/users/audio/dummy-audio.mp3">
                        </audio>
                    </div>
                </div>
            </div>

            <!-- ***** Popular Artists ***** -->
            <div class="col-12 col-lg-4">
                <div class="popular-artists-area mb-100">
                    <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                        <p>See what’s new</p>
                        <h2>Popular Artist</h2>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa1.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Sam Smith</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="150ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa2.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>William Parker</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="200ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa3.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Jessica Walsh</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="250ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa4.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Tha Stoves</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa5.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>DJ Ajay</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="350ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa6.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Radio Vibez</p>
                        </div>
                    </div>

                    <!-- Single Artist -->
                    <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="400ms">
                        <div class="thumbnail">
                            <img src="/users/img/bg-img/pa7.jpg" alt="">
                        </div>
                        <div class="content-">
                            <p>Music 4u</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ##### Miscellaneous Area End ##### -->


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