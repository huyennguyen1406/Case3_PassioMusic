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
    <meta charset="UTF-8">
    <title>Sign up / Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="login-or-register.css">
    <link rel="stylesheet" href="font.css">
</head>
<body>
<div class="main">
    <input type="checkbox" id="chk" aria-hidden="true">

    <div class="signup">
        <form action="/home?action=registerPost" method="post">
            <label for="chk" aria-hidden="true">Sign up</label>
            <input type="text" name="userName" placeholder="Signup name" required="">
            <input type="password" name="password" placeholder="Password" required="">
            <select name="role" id="role">
                <optgroup label="Select your roles">
                    <option value="3">Users</option>
                    <option value="2">Singer</option>
                </optgroup>
            </select>
            <button name="submit" type="submit">Sign Up</button>
        </form>
    </div>

    <div class="login">
        <form action="/home?action=checkLoginAndRole" method="post">
            <label for="chk" aria-hidden="true">Login</label>
            <input type="text" name="userName" placeholder="Login name" required="">
            <input type="password" name="password" placeholder="Password" required="">
            <button>Login</button>
        </form>
    </div>
</div>
</body>
</html>

