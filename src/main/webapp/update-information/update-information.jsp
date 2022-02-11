<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10-Feb-22
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >
<head>
    <title>Title</title>
</head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"
      integrity="sha384-T8Gy5hrqNKT+hzMclPo118YTQO6cYprQmhrYwIiQ/3axmI1hQomh7Ud2hPOy8SP1" crossorigin="anonymous">
<div class="content py-3  bg-light">
</div>
<div class="content py-5  bg-light">
    <div class="container">
        <div class="row">
            <div class="col-md-10 offset-md-1">
                <span class="anchor" id="formUserEdit"></span>

                <div class="card card-outline-secondary">
                    <div class="card-header">
                        <h3 class="mb-0">User Information</h3>
                    </div>
                    <div class="card-body">
                        <form action="/home?action=loginPost" method="post" class="form" role="form" autocomplete="off">
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Username</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="userName" type="text" value="${userName}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Password</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="password" type="password" value="${password}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Full name</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="fullName" type="text" value="Hào Dajk">
                                </div>
                            </div>
<%--                            <div class="form-group row">--%>
<%--                                <label class="col-lg-3 col-form-label form-control-label">Full name</label>--%>
<%--                                <div class="col-lg-9">--%>
<%--                                    <input class="form-control" name="name" type="text" require="" value="Jane">--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Phone Number</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="phoneNumber" type="text" require="" value="0123456789">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="email" type="email" require="" value="email@gmail.com">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label">Address</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="address" type="text" value="VietNam">
                                </div>
                            </div>
                            <div class="form-group row" hidden>
                                <label class="col-lg-3 col-form-label form-control-label">Role</label>
                                <div class="col-lg-9">
                                    <input class="form-control" name="role" type="text" value="${role}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-lg-3 col-form-label form-control-label"></label>
                                <div class="col-lg-9">
                                    <input type="reset" class="btn btn-secondary" value="Cancel">
                                    <input type="submit" class="btn btn-primary" value="Save Changes">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="content py-4 bg-light"></div>
<div class="copyright bg-light1 pt-4">
    <div class="container">
        <div class="row justify-content-md-center">
            <p> Power by Group Mood with luv </p>
        </div>
    </div>
</div>
</body>
</html>
