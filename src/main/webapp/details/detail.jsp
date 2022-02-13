<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/details/detail.css">
</head>
<body>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<div class="container">
    <br>
    <div class="card">
        <div class="row">
            <aside class="col-sm-5 border-right">
                <article class="gallery-wrap">
                    <div class="img-big-wrap">
                        <div>
                            <img src="${song.getSong().getLinkImg()}">
                        </div>
                    </div>
                </article>
            </aside>
            <aside class="col-sm-7">
                <article class="card-body p-5">
                    <h3 class="title mb-3">${song.getSong().getNameSong()}</h3>

                    <p class="price-detail-wrap">
	<span class="price h3 text-warning">
		<span class="currency">US $ </span><span class="num">${song.getSong().getPrice()}</span>
	</span>
                    </p>
                    <dl class="item-property">
                        <dt>Miêu tả</dt>

                        <dd><p>Viết gì mà chả được </p></dd>
                    </dl>
                    <dl class="param param-feature">
                        <dt>Singer</dt>
                        <dd>${song.getNameSinger()}</dd>
                    </dl>

                    <hr>
                    <div class="row">
                        <div class="col-sm-7">
                            <audio src="${song.getSong().getLinkSong()}"
                                   preload="none" controls></audio>
                        </div>
                    </div>
                    <hr>

                    <a href="/home?action=addToCart&idSong=${song.getSong().getId()}&userName=${userName}&password=${password}" class="btn btn-lg btn-outline-primary text-uppercase"> <i
                            class="fas fa-shopping-cart"></i> Add to cart </a>
                    <a href="/home?action=checkLoginAndRole&userName=${userName}&password=${password}"
                       class="btn btn-lg btn-primary text-uppercase"> Back to Home </a>
                </article>
            </aside>
        </div>
    </div>

</div>
</body>
</html>