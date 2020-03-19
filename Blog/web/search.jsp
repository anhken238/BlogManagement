
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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

<%--<body>--%>

<%--<!-- Header--%>
<%--================================================== -->--%>
<%--<header id="top">--%>

    <%--<div class="row">--%>

        <%--<div class="header-content twelve columns">--%>

            <%--<h1 id="logo-text"><a href="/home" title="">Keep It Simple</a></h1>--%>
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
                <%--<%--%>
                    <%--if(session.getAttribute("Admin") == null){--%>
                <%--%>--%>
                <%--<li><a href="login.jsp">Login</a></li>--%>
                <%--<%} else{--%>
                    <%--if(session.getAttribute("role") == "admin"){--%>
                <%--%>--%>
                <%--<li><a href="admin.jsp">Management Blog</a></li>--%>
                <%--<%} %>--%>
                <%--<li><a style="margin-left: 200px" href="/users?action=view&id=${sessionScope['idUser']}">Welcome ${sessionScope['Admin']}</a></li>--%>
                <%--<li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>--%>
                <%--<%} %>--%>
            <%--</ul> <!-- end #nav -->--%>

        <%--</div>--%>

    <%--</nav> <!-- end #nav-wrap -->--%>

<%--</header> <!-- Header End -->--%>

<%--<!-- Content--%>
<%--================================================== -->--%>
<%--<div id="content-wrap">--%>

    <%--<div class="row">--%>

        <%--<div id="main" class="eight columns">--%>

            <%--<c:forEach items="${requestScope['result']}" var="searchResult">--%>
                <%--<article class="entry">--%>

                    <%--<header class="entry-header">--%>

                        <%--<h2 class="entry-title">--%>
                            <%--<a href="/posts?action=view&id=${searchResult.getId()}" title="">${searchResult.getTitle()}</a>--%>
                            <%--<p>${param.message}</p>--%>
                        <%--</h2>--%>

                        <%--<div class="entry-meta">--%>
                            <%--<ul>--%>
                                <%--<li>${searchResult.getDateCreated()}</li>--%>
                                <%--<span class="meta-sep">&bull;</span>--%>
                                <%--<li>${searchResult.getCreator()}</li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>

                    <%--</header>--%>

                    <%--<div class="entry-content">--%>
                        <%--<p>--%>
                                <%--${searchResult.getIntroduce()}--%>

                        <%--</p>--%>
                    <%--</div>--%>

                <%--</article>--%>
                <%--<!-- end entry -->--%>
            <%--</c:forEach>--%>

            <%--<div class="pagenav">--%>
                <%--<p>--%>
                    <%--<a rel="prev" href="#">Prev</a>--%>
                    <%--<a rel="next" href="#">Next</a>--%>
                <%--</p>--%>
            <%--</div>--%>


        <%--</div> <!-- end main -->--%>

        <%--<div id="sidebar" class="four columns">--%>

            <%--&lt;%&ndash;            new&ndash;%&gt;--%>
            <%--<div class="widget widget_search">--%>
                <%--<h3>Search</h3>--%>
                <%--<form method="post" action="/home?action=search">--%>

                    <%--<input type="text" value="Search here..." name="search" id="search"--%>
                           <%--onblur="if(this.value == '') { this.value = 'Search here...'; }"--%>
                           <%--onfocus="if (this.value == 'Search here...') { this.value = ''; }" class="text-search">--%>
                    <%--<input type="submit" value="" class="submit-search">--%>

                <%--</form>--%>
            <%--</div>--%>

            <%--<div class="widget widget_categories group">--%>
                <%--<h3>Categories.</h3>--%>
                <%--<ul>--%>
                    <%--<c:forEach items='${requestScope["allPosts"]}' var="post">--%>
                        <%--<li><a href="/home?action=${post.getNameCategories()}"--%>
                               <%--title="">${post.getNameCategories()}</a></li>--%>
                    <%--</c:forEach>--%>
                <%--</ul>--%>
            <%--</div>--%>

        <%--</div> <!-- end sidebar -->--%>

    <%--</div> <!-- end row -->--%>

<%--</div> <!-- end content-wrap -->--%>


<%--<!-- Footer--%>
<%--================================================== -->--%>
<%--<footer>--%>

    <%--<div class="row">--%>

        <%--<div class="twelve columns">--%>
            <%--<ul class="social-links">--%>
                <%--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--%>
                <%--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--%>
                <%--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--%>
                <%--<li><a href="#"><i class="fa fa-github-square"></i></a></li>--%>
                <%--<li><a href="#"><i class="fa fa-instagram"></i></a></li>--%>
                <%--<li><a href="#"><i class="fa fa-flickr"></i></a></li>--%>
                <%--<li><a href="#"><i class="fa fa-skype"></i></a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>

        <%--<div class="six columns info">--%>

            <%--<h3>About Keep It Simple</h3>--%>

            <%--<p>This is Photoshop's version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet.--%>
                <%--Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem--%>
                <%--nibh id elit.--%>
            <%--</p>--%>

            <%--<p>Lorem ipsum Sed nulla deserunt voluptate elit occaecat culpa cupidatat sit irure sint--%>
                <%--sint incididunt cupidatat esse in Ut sed commodo tempor consequat culpa fugiat incididunt.</p>--%>

        <%--</div>--%>

        <%--<div class="four columns">--%>

            <%--<h3>Photostream</h3>--%>

            <%--<ul class="photostream group">--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
                <%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
            <%--</ul>--%>

        <%--</div>--%>

        <%--<div class="two columns">--%>
            <%--<h3 class="social">Navigate</h3>--%>

            <%--<ul class="navigate group">--%>
                <%--<li><a href="#">Home</a></li>--%>
                <%--<li><a href="#">Blog</a></li>--%>
                <%--<li><a href="#">Demo</a></li>--%>
                <%--<li><a href="#">Archives</a></li>--%>
                <%--<li><a href="#">About</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>

        <%--<p class="copyright">&copy; Copyright 2014 Keep It Simple. &nbsp; Design by--%>
            <%--<a title="Styleshout" href="http://www.styleshout.com/">Styleshout</a>.</p>--%>

    <%--</div> <!-- End row -->--%>

    <%--<div id="go-top"><a class="smoothscroll" title="Back to Top" href="#top"><i class="fa fa-chevron-up"></i></a></div>--%>

<%--</footer> <!-- End Footer-->--%>


<%--<!-- Java Script--%>
<%--================================================== -->--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<%--<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>--%>
<%--<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>--%>
<%--<script src="js/main.js"></script>--%>

<%--</body>--%>

<%--</html>--%>





<%--<%@ page import="service.post.PostImpl" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="model.Post" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<!--[if lt IE 8 ]><html class="no-js ie ie7" lang="en"> <![endif]-->--%>
<%--<!--[if IE 8 ]><html class="no-js ie ie8" lang="en"> <![endif]-->--%>
<%--<!--[if IE 9 ]><html class="no-js ie ie9" lang="en"> <![endif]-->--%>
<%--<!--[if (gte IE 8)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->--%>
<%--<head>--%>

<%--<!--- Basic Page Needs--%>
<%--================================================== -->--%>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="utf-8">--%>
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

<%--<body>--%>
<%--<%--%>
<%--PostImpl postDao = new PostImpl();--%>
<%--List<Post> listPost = postDao.getAllPosts();--%>
<%--int start =0, end = 3;--%>
<%--if(listPost.size() < 3){--%>
<%--end = listPost.size();--%>
<%--}--%>
<%--if(request.getParameter("start") != null){--%>
<%--start = Integer.parseInt(request.getParameter("start"));--%>

<%--}--%>
<%--if(request.getParameter("end") != null){--%>
<%--end = Integer.parseInt(request.getParameter("end"));--%>
<%--}--%>
<%--List<Post> list = postDao.getListByPage(listPost,start,end);--%>

<%--%>--%>
<%--<!-- Header--%>
<%--================================================== -->--%>
<%--<header id="top">--%>

<%--<div class="row">--%>

<%--<div class="header-content twelve columns">--%>

<%--<h1 id="logo-text"><a href="/home" title="">Keep It Simple</a></h1>--%>
<%--<p id="intro">Simple blog</p>--%>

<%--</div>--%>

<%--</div>--%>

<%--<nav id="nav-wrap">--%>

<%--<a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show Menu</a>--%>
<%--<a class="mobile-btn" href="#" title="Hide navigation">Hide Menu</a>--%>

<%--<div class="row">--%>

<%--<ul id="nav" class="nav">--%>
<%--<li class="current"><a class="button" href="/home">Home</a></li>--%>
<%--<li><a href="/home?action=Javascript">Javascript</a></li>--%>
<%--<li><a href="/home?action=Java">Java</a></li>--%>
<%--<li><a href="/home?action=Python">Python</a></li>--%>
<%--<%--%>
<%--if(session.getAttribute("Admin") == null){--%>
<%--%>--%>
<%--<li><a href="login.jsp">Login</a></li>--%>
<%--<%} else{--%>
<%--if(session.getAttribute("role") == "admin"){--%>
<%--%>--%>
<%--<li><a href="admin.jsp">Management</a></li>--%>
<%--<%} %>--%>
<%--<li><a style="margin-left: 200px" href="/users?action=view&id=${sessionScope['idUser']}">Welcome ${sessionScope['Admin']}</a></li>--%>
<%--<li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>--%>
<%--<%} %>--%>
<%--</ul> <!-- end #nav -->--%>

<%--</div>--%>

<%--</nav> <!-- end #nav-wrap -->--%>

<%--</header> <!-- Header End -->--%>

<%--<!-- Content--%>
<%--================================================== -->--%>
<%--<div id="content-wrap" enctype ="multipart/form-data">--%>

<%--<div class="row">--%>

<%--<div id="main" class="eight columns">--%>

<%--<article class="entry">--%>

<%--<header class="entry-header">--%>

<%--<% for(Post p : list){%>--%>
<%--<h2 class="entry-title">--%>
<%--<a href="/home?action=<%=p.getNameCategories()%>"--%>
<%--title=""><%=p.getNameCategories()%></a>--%>
<%--</h2>--%>

<%--<div class="entry-meta">--%>
<%--<ul>--%>
<%--<li><%=p.getDateCreated()%></li>--%>
<%--<span class="meta-sep">&bull;</span>--%>
<%--<li><%=p.getCreator()%></li>--%>
<%--</ul>--%>
<%--</div>--%>

<%--</header>--%>

<%--<image src="/images/<%=p.getImage()%>"></image>--%>

<%--<div class="entry-content">--%>
<%--<h5><a href="/posts?action=view&id=<%=p.getId()%>">--%>
<%--<%=p.getTitle()%></a>--%>
<%--</h5>--%>
<%--<p>--%>
<%--<%=p.getIntroduce()%>--%>
<%--</p>--%>
<%--</div>--%>
<%--<%--%>
<%--}--%>
<%--%>--%>

<%--</article> <!-- end entry -->--%>

<%--</div> <!-- end main -->--%>

<%--<div id="sidebar" class="four columns">--%>

<%--<div class="widget widget_search">--%>
<%--<h3>Search</h3>--%>
<%--<form method="post" action="/home?action=search">--%>

<%--<input type="text" value="Search here..." name="search" id="search"--%>
<%--onblur="if(this.value == '') { this.value = 'Search here...'; }"--%>
<%--onfocus="if (this.value == 'Search here...') { this.value = ''; }" class="text-search">--%>
<%--<input type="submit" value="" class="submit-search">--%>

<%--</form>--%>
<%--<p>${param.message}</p>--%>
<%--</div>--%>

<%--&lt;%&ndash;<div class="widget widget_categories group">&ndash;%&gt;--%>
<%--<h3>Categories.</h3>--%>
<%--<ul>--%>
<%--<c:forEach items='${requestScope["allPosts"]}' var="post">--%>
<%--<li><a href="/home?action=${post.getNameCategories()}"--%>
<%--title="">${post.getNameCategories()}</a></li>--%>
<%--</c:forEach>--%>
<%--</ul>--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>

<%--</div> <!-- end sidebar -->--%>

<%--</div> <!-- end row -->--%>

<%--</div> <!-- end content-wrap -->--%>
<%--<div style="clear: both"></div>--%>
<%--<%--%>
<%--int a,b;--%>
<%--int limit = listPost.size()/3;--%>
<%--if(limit * 3 < listPost.size()){--%>
<%--limit += 1;--%>
<%--}--%>
<%--for (int i = 1; i <= limit; i++){--%>
<%--a = (i-1) * 3;--%>
<%--b = i * 3;--%>
<%--if (b > listPost.size()){--%>
<%--b = listPost.size();--%>
<%--}--%>

<%--%>--%>
<%--<li class="page-numbers"> <a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>--%>
<%--<%--%>
<%--}--%>
<%--%>--%>
<%--<!-- Footer--%>
<%--================================================== -->--%>
<%--<footer>--%>

<%--<div class="row">--%>

<%--<div class="twelve columns">--%>
<%--<ul class="social-links">--%>
<%--<li><a href="#"><i class="fa fa-facebook"></i></a></li>--%>
<%--<li><a href="#"><i class="fa fa-twitter"></i></a></li>--%>
<%--<li><a href="#"><i class="fa fa-google-plus"></i></a></li>--%>
<%--<li><a href="#"><i class="fa fa-github-square"></i></a></li>--%>
<%--<li><a href="#"><i class="fa fa-instagram"></i></a></li>--%>
<%--<li><a href="#"><i class="fa fa-flickr"></i></a></li>--%>
<%--<li><a href="#"><i class="fa fa-skype"></i></a></li>--%>
<%--</ul>--%>
<%--</div>--%>

<%--<div class="six columns info">--%>

<%--<h3>About Keep It Simple</h3>--%>

<%--<p>This is Photoshop's version of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet.--%>
<%--Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem--%>
<%--nibh id elit.--%>
<%--</p>--%>

<%--<p>Lorem ipsum Sed nulla deserunt voluptate elit occaecat culpa cupidatat sit irure sint--%>
<%--sint incididunt cupidatat esse in Ut sed commodo tempor consequat culpa fugiat incididunt.</p>--%>

<%--</div>--%>

<%--<div class="four columns">--%>

<%--<h3>Photostream</h3>--%>

<%--<ul class="photostream group">--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--<li><a href="#"><img alt="thumbnail" src="images/thumb.jpg"></a></li>--%>
<%--</ul>--%>

<%--</div>--%>

<%--<div class="two columns">--%>
<%--<h3 class="social">Navigate</h3>--%>

<%--<ul class="navigate group">--%>
<%--<li><a href="#">Home</a></li>--%>
<%--<li><a href="#">Blog</a></li>--%>
<%--<li><a href="#">Demo</a></li>--%>
<%--<li><a href="#">Archives</a></li>--%>
<%--<li><a href="#">About</a></li>--%>
<%--</ul>--%>
<%--</div>--%>

<%--<p class="copyright"> &copy; CodeGym - C0419H1 - Team Pro &copy; Copyright 2014 Keep It Simple. &nbsp; Design by--%>
<%--<a title="Styleshout" href="http://www.styleshout.com/">Styleshout</a>.</p>--%>

<%--</div> <!-- End row -->--%>

<%--<div id="go-top"><a class="smoothscroll" title="Back to Top" href="#top"><i class="fa fa-chevron-up"></i></a></div>--%>

<%--</footer> <!-- End Footer-->--%>


<%--<!-- Java Script--%>
<%--================================================== -->--%>
<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>--%>
<%--<script>window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')</script>--%>
<%--<script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>--%>
<%--<script src="js/main.js"></script>--%>

<%--</body>--%>

<%--</html>--%>











<%@ page import="service.post.PostImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="service.comment.CommentImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.category.CategoryImpl" %>
<%@ page import="model.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>BlogNDA-PXU</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-aller.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/coin-slider.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="utf-8">
    <style>
        #pageNumber{
            display: inline;

        }
        #pageNumber a{
            color: white;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }

        #pageNumber a:hover{
            background-color: #e8f2ff;
        }
    </style>
</head>
<body>
<%
    CategoryImpl categoryDao = new CategoryImpl();
    List<Category> categoryList = categoryDao.getAllCategory();
    PostImpl postDao = new PostImpl();
    String key = String.valueOf(request.getAttribute("a"));
    List<Post> listPost = postDao.getSearchResults(key);
    int start =0, end = 2;
    if(listPost.size() < 2){
        end = listPost.size();
    }
    if(request.getParameter("start") != null){
        start = Integer.parseInt(request.getParameter("start"));

    }
    if(request.getParameter("end") != null){
        end = Integer.parseInt(request.getParameter("end"));
    }
    List<Post> list = postDao.getListByPage(listPost,start,end);

%>
<div class="main">
    <div class="header">
        <div class="header_resize">
            <div class="logo">
                <h1><a href="/home">Phu<span>Xuan</span> <small>Nguyen Duc Anh Blog</small></a></h1>
            </div>
            <div class="menu_nav">
                <ul>
                    <li class="active"><a href="/home"><span>Home Page</span></a></li>

                    <%
                        if(session.getAttribute("Admin") == null){
                    %>
                    <li><a href="login.jsp">Login|Register</a></li>
                    <%} else{
                        if(session.getAttribute("role") == "admin"){
                    %>
                    <li><a href="admin.jsp">Management</a></li>
                    <%} %>
                    <li><a style="margin-left: 200px" href="/users?action=view&id=${sessionScope['idUser']}">Welcome ${sessionScope['Admin']}</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
                    <%} %>
                </ul>
            </div>
            <div class="clr"></div>
            <div class="slider">
                <div id="coin-slider"> <a href="#"><img src="images/pxu1.jpg" width="935" height="307" alt="" /> </a> <a href="#"><img src="images/pxu2.jpg" width="935" height="307" alt="" /> </a> <a href="#"><img src="images/pux33.jpg" width="935" height="307" alt="" /> </a> </div>
                <div class="clr"></div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="content">
        <div class="content_resize">
            <div class="mainbar">
                <% for(Post p : list){%>
                <div class="article">

                    <%--<h2><span>Excellent Solution</span> For Your Business</h2>--%>
                    <h2><a href="/posts?action=view&id=<%=p.getId()%>">
                        <%=p.getTitle()%></a></h2>
                    <p class="infopost">Posted on <span class="date"><%=p.getDateCreated()%></span> by <a href="#"><%=p.getCreator()%></a> &nbsp;&nbsp;|&nbsp;&nbsp; Filed under <a href="#">templates</a>, <a href="#">internet</a> <a href="/posts?action=view&id=<%=p.getId()%>" class="com">Comments
                        <%{
                            CommentImpl commentDao = new CommentImpl();
                            int count = commentDao.countComments(p.getId());
                        %>
                        <span>
                            <%=count%>
                        </span>
                        <%}%>
                    </a></p>
                    <div class="clr"></div>
                    <div class="img"><img  src="/images/<%=p.getImage()%>" width="177" height="213" alt="" class="fl" /></div>
                    <div class="post_content">
                        <p> <%=p.getIntroduce()%></p>
                        <p class="spec"><a href="/posts?action=view&id=<%=p.getId()%>" class="rm">Read more &raquo;</a></p>
                    </div>

                    <div class="clr"></div>
                </div>
                <%
                    }
                %>

                <div style="clear: both"></div>
                <%
                    int a,b;
                    int limit = listPost.size()/2;
                    if(limit * 2 < listPost.size()){
                        limit += 1;
                    }
                    for (int i = 1; i <= limit; i++) {
                        a = (i - 1) * 2;
                        b = i * 2;
                        if (b > listPost.size()) {
                            b = listPost.size();
                        }

                %>
                <%--<li class="page-numbers"> <a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>--%>
                <p id="pageNumber"><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></p>
                <%
                    }
                %>

                <%--<p class="pages"><small>Page 1 of 2</small> <span>1</span> <a href="#">2</a> <a href="#">&raquo;</a></p>--%>
            </div>
            <div class="sidebar">
                <div class="searchform">
                    <form id="formsearch" name="formsearch" method="post" action="/home?action=search">
            <span>
            <input name="search" class="editbox_search" id="editbox_search" maxlength="80"  type="text" placeholder="Search here ..."
                   <%--onblur="if(this.value == '') { this.value = ''; }"--%>
                   <%--onfocus="if (this.value == 'Search here...') { this.value = ''; }"--%>
            />
            </span>
                        <input name="button_search" src="images/search.gif" class="button_search" type="image" />
                        <p>${param.message}</p>
                    </form>

                </div>
                <div class="clr"></div>
                <div class="gadget">
                    <h2 class="star"><span>Category</span></h2>
                    <div class="clr"></div>
                    <ul class="sb_menu">
                        <li><a href="/home">Home</a></li>
                        <%--<c:forEach items='${requestScope["allPosts"]}' var="post">--%>
                        <%--<li><a href="/home?action=${post.getNameCategories()}"--%>
                        <%--title="">${post.getNameCategories()}</a></li>--%>
                        <%--</c:forEach>--%>
                        <% for(Category c : categoryList){%>
                        <li><a href="/home?action=<%=c.getId()%>"
                               title=""><%=c.getNameCategories()%></a></li>
                        <%}%>
                    </ul>
                </div>
                <div class="gadget">
                    <h2 class="star"><span>Top Pick </span></h2>
                    <div class="clr"></div>
                    <%
                        List<Post> postsTop = postDao.topPosts();
                    %>

                    <ul class="ex_menu">
                        <% for(Post t : postsTop){%>
                        <li><a href="/posts?action=view&id=<%=t.getId()%>"><%=t.getTitle()%></a>
                        </li>
                        <%}%>
                    </ul>

                </div>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="fbg">
        <div class="fbg_resize">
            <div class="col c1">
                <h2><span>Image</span> Gallery</h2>
                <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
            <div class="col c2">
                <h2><span>Services</span> Overview</h2>
                <p>Curabitur sed urna id nunc pulvinar semper. Nunc sit amet tortor sit amet lacus sagittis posuere cursus vitae nunc.Etiam venenatis, turpis at eleifend porta, nisl nulla bibendum justo.</p>
                <ul class="fbg_ul">
                    <li><a href="#">Lorem ipsum dolor labore et dolore.</a></li>
                    <li><a href="#">Excepteur officia deserunt.</a></li>
                    <li><a href="#">Integer tellus ipsum tempor sed.</a></li>
                </ul>
            </div>
            <div class="col c3">
                <h2><span>Contact</span> Us</h2>
                <p>Nullam quam lorem, tristique non vestibulum nec, consectetur in risus. Aliquam a quam vel leo gravida gravida eu porttitor dui.</p>
                <p class="contact_info"> <span>Address:</span> 1458 TemplateAccess, USA<br />
                    <span>Telephone:</span> +123-1234-5678<br />
                    <span>FAX:</span> +458-4578<br />
                    <span>Others:</span> +301 - 0125 - 01258<br />
                    <span>E-mail:</span> <a href="#">mail@yoursitename.com</a> </p>
            </div>
            <div class="clr"></div>
        </div>
    </div>
    <div class="footer">
        <div class="footer_resize">
            <p class="lf">Copyright &copy; <a href="#">Domain Name</a>. All Rights Reserved</p>
            <p class="rf">Design by <a target="_blank" href="http://www.dreamtemplate.com/">DreamTemplate</a></p>
            <div style="clear:both;"></div>
        </div>
    </div>
</div>
</body>
</html>
