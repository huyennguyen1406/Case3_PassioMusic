<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart Detail</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/cart/cart.css">

</head>
<body>
<div class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="main-heading">Song Cart</div>
                <div class="table-cart">
                    <table>
                        <thead>
                        <tr>
                            <th>Song Name ${idCart}</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cart.getSongs()}" var="song">
                            <tr>
                                <td>
                                    <div class="display-flex align-center">
                                        <div class="img-product">
                                            <img src="${song.getLinkImg()}"
                                                 alt="" class="mCS_img_loaded">
                                        </div>
                                        <div class="name-product">
                                                ${song.getNameSong()}
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="price">
                                            ${song.getPrice()}
                                    </div>
                                </td>
                                <td>
                                    <div class="total">
                                            ${song.getPrice()}
                                    </div>
                                </td>
                                <td>
                                    <a href="/home?action=deleteSongFromCart&idSong=${song.getId()}&idCart=${idCart}&userName=${userName}&password=${password}"
                                       title="">
                                        <img src="https://www.seekpng.com/png/detail/202-2022743_edit-delete-icon-png-download-delete-icon-png.png"
                                             style="width: 30px; height: 30px" alt="" class="mCS_img_loaded">
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="coupon-box">
                        <form action="#" method="get" accept-charset="utf-8">
                            <div class="coupon-input">
                                <input type="text" name="coupon code" placeholder="Coupon Code">
                                <button type="submit" class="round-black-btn">Apply Coupon</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /.table-cart -->
            </div>
            <!-- /.col-lg-8 -->
            <div class="col-lg-4">
                <div class="cart-totals">
                    <h3>Cart Totals</h3>
                    <form action="#" method="get" accept-charset="utf-8">
                        <table>
                            <tbody>
                            <tr>
                                <td>Subtotal</td>
                                <td class="subtotal">${total}</td>
                            </tr>
                            <tr>
                                <td>Shipping</td>
                                <td class="free-shipping">Free Shipping</td>
                            </tr>
                            <tr class="total-row">
                                <td>Total</td>
                                <td class="price-total">${total}</td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn-cart-totals">
                            <a href="/home?action=payMent&idCart=${idCart}&userName=${userName}&password=${password}"
                               class="update round-black-btn" title="">Payment</a><br>
                            <a href="#" class="checkout round-black-btn" title="">Checkout</a>
                        </div>

                        <!-- /.btn-cart-totals -->
                    </form>
                    <!-- /form -->
                </div>
                <!-- /.cart-totals -->
            </div>
            <!-- /.col-lg-4 -->
        </div>
    </div>
</div>
<div class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="main-heading">Song Payment</div>
                <div class="table-cart">
                    <table>
                        <thead>
                        <tr>
                            <th>Song Name</th>
                            <th>Price</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${songOwns}" var="songOwn">
                            <tr>
                                <td>
                                    <div class="display-flex align-center">
                                        <div class="img-product">
                                            <img src="${songOwn.getSong().getLinkImg()}"
                                                 alt="" class="mCS_img_loaded">
                                        </div>
                                        <div class="name-product">
                                                ${songOwn.getSong().getNameSong()}
                                            <br>${songOwn.getNameSinger()}
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="price">
                                            ${songOwn.getSong().getPrice()}
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.table-cart -->
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>