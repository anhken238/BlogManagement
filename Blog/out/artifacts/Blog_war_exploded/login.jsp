<%--&lt;%&ndash;--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<!--[if lt IE 8 ]><html class="no-js ie ie7" lang="en"> <![endif]-->--%>
<%--<!--[if IE 8 ]><html class="no-js ie ie8" lang="en"> <![endif]-->--%>
<%--<!--[if IE 9 ]><html class="no-js ie ie9" lang="en"> <![endif]-->--%>
<%--<!--[if (gte IE 8)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->--%>
<%--<head>--%>

    <%--<!--- Basic Page Needs--%>
    <%--================================================== -->--%>
    <%--<meta charset="utf-8">--%>
    <%--<title>Keep It Simple.</title>--%>
    <%--<meta name="description" content="">--%>
    <%--<meta name="author" content="">--%>

    <%--<!-- mobile specific metas--%>
   <%--================================================== -->--%>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">--%>

    <%--<!-- CSS--%>
    <%--================================================== -->--%>
    <%--<link rel="stylesheet" href="css/default.css">--%>
    <%--<link rel="stylesheet" href="css/layout.css">--%>
    <%--<link rel="stylesheet" href="css/media-queries.css">--%>

    <%--<!-- Script--%>
    <%--================================================== -->--%>
    <%--<script src="js/modernizr.js"></script>--%>

    <%--<!-- Favicons--%>
     <%--================================================== -->--%>
    <%--<link rel="shortcut icon" href="favicon.png">--%>

<%--</head>--%>

<%--<body class="page">--%>

<%--<!-- Header--%>
<%--================================================== -->--%>
<%--<header id="top">--%>

    <%--<div class="row">--%>

        <%--<div class="header-content twelve columns">--%>

            <%--<h1 id="logo-text"><a href="index.html" title="">Keep It Simple</a></h1>--%>
            <%--<p id="intro">Simple blog</p>--%>

        <%--</div>--%>

    <%--</div>--%>

    <%--<nav id="nav-wrap">--%>

        <%--<a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show Menu</a>--%>
        <%--<a class="mobile-btn" href="#" title="Hide navigation">Hide Menu</a>--%>

        <%--<div class="row">--%>

            <%--<ul id="nav" class="nav">--%>
                <%--<li><a href="/home">Home</a></li>--%>
                <%--<li><a href="/home?action=Javascript">Javascript</a></li>--%>
                <%--<li><a href="/home?action=Java">Java</a></li>--%>
                <%--<li><a href="/home?action=Python">Python</a></li>--%>
                <%--<li class="current"><a class="button"  href="login.jsp">Login</a></li>--%>
            <%--</ul> <!-- end #nav -->--%>

        <%--</div>--%>

    <%--</nav> <!-- end #nav-wrap -->--%>

<%--</header> <!-- Header End -->--%>

<%--<!-- Content--%>
<%--================================================== -->--%>
<%--<div id="content-wrap">--%>

    <%--<div class="row">--%>

        <%--<div id="main" class="eight columns">--%>

            <%--<section class="page">--%>

                <%--<div class="respond">--%>

                    <%--<h3>Already have account? Login please!</h3>--%>

                    <%--<!-- form -->--%>
                    <%--<form name="loginForm" id="loginForm" method="post" action="<%=request.getContextPath()%>--%>
                    <%--/LoginServlet" onsubmit="return validate()">--%>
                        <%--<fieldset>--%>

                            <%--<div class="group">--%>
                                <%--<label for="loginUsername">Username <span class="required">*</span></label>--%>
                                <%--<input name="loginUsername" type="text" id="loginUsername" size="35" value=""/>--%>
                            <%--</div>--%>

                            <%--<div class="group">--%>
                                <%--<label for="loginPassword">Password <span class="required">*</span></label>--%>
                                <%--<input name="loginPassword" type="password" id="loginPassword" size="35" value=""/>--%>
                            <%--</div>--%>

                            <%--<div class="group">--%>
                                <%--<span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""--%>
                                        <%--: request.getAttribute("errMessage")%></span>--%>
                            <%--</div>--%>

                            <%--<button type="submit" class="submit">Login</button> <button type="reset" class="submit">Reset</button> <button type="submit" class="submit"><a href="users?action=create" style="color: white">Register</a></button>--%>

                        <%--</fieldset>--%>
                    <%--</form> <!-- Form End -->--%>

                <%--</div> <!-- Respond End -->--%>

            <%--</section> <!-- End page -->--%>

        <%--</div> <!-- End main -->--%>


    <%--</div> <!-- end row -->--%>

<%--</div> <!-- end content-wrap -->--%>


<%--<!-- Footer--%>
<%--================================================== -->--%>
<%--<footer>--%>

<%--</footer> <!-- End Footer-->--%>


<%--<!-- Java Script--%>
<%--================================================== -->--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<%--<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>--%>
<%--<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>--%>
<%--<script src="js/main.js"></script>--%>

<%--<script>--%>
    <%--function validate() {--%>
        <%--var username = document.loginForm.loginUsername.value;--%>
        <%--var password = document.loginForm.loginPassword.value;--%>

        <%--if (username === null || username === "") {--%>
            <%--alert("Username cannot be blank");--%>
            <%--return false;--%>
        <%--} else if (password === null || password === "") {--%>
            <%--alert("Password cannot be blank");--%>
            <%--return false;--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>

<%--</body>--%>

<%--</html>--%>












<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <Style>
        body{
            margin:0;
            color:#6a6f8c;
            background-image:url("<%=request.getContextPath()%>/images/main_bg.jpg");
            /* background:#c8c8c8; */
            font:600 16px/18px 'Open Sans',sans-serif;
        }
        *,:after,:before{box-sizing:border-box}
        .clearfix:after,.clearfix:before{content:'';display:table}
        .clearfix:after{clear:both;display:block}
        a{color:inherit;text-decoration:none}

        .login-wrap{
            width:100%;
            margin:auto;
            max-width:525px;
            min-height:670px;
            position:relative;
            background:url(https://raw.githubusercontent.com/khadkamhn/day-01-login-form/master/img/bg.jpg) no-repeat center;
            box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19);
        }
        .login-html{
            width:100%;
            height:100%;
            position:absolute;
            padding:90px 70px 50px 70px;
            background:rgba(40,57,101,.9);
        }
        .login-html .sign-in-htm,
        .login-html .sign-up-htm{
            top:0;
            left:0;
            right:0;
            bottom:0;
            position:absolute;
            transform:rotateY(180deg);
            backface-visibility:hidden;
            transition:all .4s linear;
        }
        .login-html .sign-in,
        .login-html .sign-up,
        .login-form .group .check{
            display:none;
        }
        .login-html .tab,
        .login-form .group .label,
        .login-form .group .button{
            text-transform:uppercase;
        }
        .login-html .tab{
            font-size:22px;
            margin-right:15px;
            padding-bottom:5px;
            margin:0 15px 10px 0;
            display:inline-block;
            border-bottom:2px solid transparent;
        }
        .login-html .sign-in:checked + .tab,
        .login-html .sign-up:checked + .tab{
            color:#fff;
            border-color:#1161ee;
        }
        .login-form{
            min-height:345px;
            position:relative;
            perspective:1000px;
            transform-style:preserve-3d;
        }
        .login-form .group{
            margin-bottom:15px;
        }
        .login-form .group .label,
        .login-form .group .input,
        .login-form .group .button{
            width:100%;
            color:#fff;
            display:block;
        }
        .login-form .group .input,
        .login-form .group .button{
            border:none;
            padding:15px 20px;
            border-radius:25px;
            background:rgba(255,255,255,.1);
        }
        .login-form .group input[data-type="password"]{
            text-security:circle;
            -webkit-text-security:circle;
        }
        .login-form .group .label{
            color:#aaa;
            font-size:12px;
        }
        .login-form .group .button{
            background:#1161ee;
        }
        .login-form .group label .icon{
            width:15px;
            height:15px;
            border-radius:2px;
            position:relative;
            display:inline-block;
            background:rgba(255,255,255,.1);
        }
        .login-form .group label .icon:before,
        .login-form .group label .icon:after{
            content:'';
            width:10px;
            height:2px;
            background:#fff;
            position:absolute;
            transition:all .2s ease-in-out 0s;
        }
        .login-form .group label .icon:before{
            left:3px;
            width:5px;
            bottom:6px;
            transform:scale(0) rotate(0);
        }
        .login-form .group label .icon:after{
            top:6px;
            right:0;
            transform:scale(0) rotate(0);
        }
        .login-form .group .check:checked + label{
            color:#fff;
        }
        .login-form .group .check:checked + label .icon{
            background:#1161ee;
        }
        .login-form .group .check:checked + label .icon:before{
            transform:scale(1) rotate(45deg);
        }
        .login-form .group .check:checked + label .icon:after{
            transform:scale(1) rotate(-45deg);
        }
        .login-html .sign-in:checked + .tab + .sign-up + .tab + .login-form .sign-in-htm{
            transform:rotate(0);
        }
        .login-html .sign-up:checked + .tab + .login-form .sign-up-htm{
            transform:rotate(0);
        }

        .hr{
            height:2px;
            margin:60px 0 50px 0;
            background:rgba(255,255,255,.2);
        }
        .foot-lnk{
            text-align:center;
        }
    </Style>
</head>
<body>

<div class="login-wrap">
    <div class="login-html">
        <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
        <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
        <div class="login-form">
            <div class="sign-in-htm">
                <span style="color:pink">
                    <c:if test='${requestScope["message"] != null}'>
                        <span class="message">${requestScope["message"]}</span>
                    </c:if>
                </span>
                <form name="loginForm" id="loginForm" method="post" action="<%=request.getContextPath()%>
                /LoginServlet" onsubmit="return validate()">
                <div class="group">
                    <label for="user" class="label">Username</label>
                    <input name="loginUsername" id="user" type="text" class="input">
                </div>
                <div class="group">
                    <label for="pass" class="label">Password</label>
                    <input name="loginPassword" id="pass" type="password" class="input" data-type="password">
                </div>
                <div class="group">
                    <!-- <input id="check" type="checkbox" class="check" checked>
                    <label for="check"><span class="icon"></span> Keep me Signed in</label> -->
                    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
                            : request.getAttribute("errMessage")%></span>
                </div>
                <div class="group">
                    <input type="submit" class="button" value="Sign In">
                </div>
                </form>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <a href="#forgot">Forgot Password?</a>
                </div>
            </div>
            <div class="sign-up-htm">
                <form method="post" action="/users?action=create">
                    <div class="group">
                        <label for="user" class="label">Username</label>
                        <input name="username" id="username" type="text" class="input"  required oninput="checkLong(this)">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Password</label>
                        <input name="password" id="password" type="password" class="input" data-type="password" required oninput="checkLong(this)">
                    </div>
                    <div class="group">
                        <label for="pass" class="label">Repeat Password</label>
                        <input name="rePassword" id="rePassword" type="password" class="input" data-type="password" oninput="check(this)">
                    </div>
                    <%--<div class="group">--%>
                        <%--<label for="pass" class="label">Email Address</label>--%>
                        <%--<input id="pass" type="text" class="input">--%>
                    <%--</div>--%>
                    <div class="group">
                        <input type="submit" class="button" value="Sign Up">
                    </div>
                </form>
                <div class="hr"></div>
                <div class="foot-lnk">
                    <label for="tab-1">Already Member?</label>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/main.js"></script>
<script>
    function check(input) {
        if (input.value != document.getElementById("password").value){
            input.setCustomValidity("Password must be Matching");
        }else {
            input.setCustomValidity('');
        }
    }
    function checkLong(input) {
        if (input.value.length < 6){
            input.setCustomValidity("Input must be more than 6 character");
        }else {
            input.setCustomValidity('');
        }
    }
</script>
<script>
    function validate() {
        var username = document.loginForm.loginUsername.value;
        var password = document.loginForm.loginPassword.value;

        if (username === null || username === "") {
            alert("Username cannot be blank");
            return false;
        } else if (password === null || password === "") {
            alert("Password cannot be blank");
            return false;
        }
    }
</script>
</body>
</html>