<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
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

                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <a href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <div class="classy-menu">

                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <div class="classynav">
                                <ul>
                                    <li><a href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}">Home</a></li>
                                    <li><a href="/home?action=getPlaylist&idUser=${id}&userName=${userName}&password=${password}">Playlist</a></li>
                                    <li><a href="/home?action=getContact&idUser=${id}&userName=${userName}&password=${password}">Liên hệ</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
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

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(/users/img/bg-img/breadcumb.jpg);">
        <div class="bradcumbContent">
            <h2>Liên hệ</h2>
        </div>
    </section>

    <section class="contact-area section-padding-100-0">
        <div class="container">
            <div class="row">

                <div class="col-12 col-lg-3">
                    <div class="contact-content mb-100">
                        <!-- Title -->
                        <div class="contact-title mb-50">
                            <h5>Thông tin liên hệ</h5>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-placeholder"></span>
                            </div>
                            <p>Đâu đó quanh đây</p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-smartphone"></span>
                            </div>
                            <p>Chưa có tiền mua điện thoại</p>
                        </div>

                        <!-- Single Contact Info -->
                        <div class="single-contact-info d-flex align-items-center">
                            <div class="icon mr-30">
                                <span class="icon-mail"></span>
                            </div>
                            <p>Email thì như nào cũng được</p>
                        </div>

                        <!-- Contact Social Info -->
                        <div class="contact-social-info mt-50">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Behance"><i class="fa fa-behance" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Linkedin"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                        </div>

                    </div>
                </div>

                <div class="col-12 col-lg-9">
                    <!-- ##### Google Maps ##### -->
                    <div class="map-area mb-100">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59527.272858149896!2d106.04261653763605!3d21.17409443263552!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31350c5b3464ae51%3A0x1a3035b9749102f9!2zVHAuIELhuq9jIE5pbmgsIELhuq9jIE5pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1644704480479!5m2!1svi!2s" allowfullscreen></iframe>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="img/core-img/logo.png" alt=""></a>
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