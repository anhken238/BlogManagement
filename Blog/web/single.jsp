

<%@ page import="service.user.UserImpl" %>
<%@ page import="model.User" %>
<%@ page import="service.category.CategoryImpl" %>
<%@ page import="model.Category" %>
<%@ page import="service.post.PostImpl" %>
<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>NDA | Blog</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
    <script type="text/javascript" src="js/cufon-yui.js"></script>
    <script type="text/javascript" src="js/cufon-aller.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <script type="text/javascript" src="js/coin-slider.min.js"></script>
</head>
<body>
<%
    CategoryImpl categoryDao = new CategoryImpl();
    List<Category> categoryList = categoryDao.getAllCategory();
    PostImpl postDao = new PostImpl();
    List<Post> listPost = postDao.getAllPosts();

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
                <h1><a href="#">black<span>pod</span> <small>Company Slogan Goes Here</small></a></h1>
            </div>
            <div class="menu_nav">
                <ul>
                    <li><a href="/home"><span>Home Page</span></a></li>
                    <%--<li><a href="support.html"><span>Support</span></a></li>--%>
                    <%--<li><a href="about.html"><span>About Us</span></a></li>--%>
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
                <div class="article">
                    <h2>${requestScope["posts"].getTitle()}</h2>
                    <div class="clr"></div>
                    <p>Posted by <a href="#">${requestScope["posts"].getCreator()}</a> <span>&nbsp;&bull;&nbsp;</span> Filed under <a href="#">templates</a>, <a href="#">internet</a></p>
                    <div class="img"><img  src="/images/${requestScope["posts"].getImage()}" width="90%" height="213" alt="" class="fl" /></div>
                    <p>${requestScope["posts"].getIntroduce()}</p>
                    <p>${requestScope["posts"].getContent()}</p>
                    <p>Tagged: <a href="#">orci</a>, <a href="#">lectus</a>, <a href="#">varius</a>, <a href="#">turpis</a></p>
                    <p><a href="#"><strong>Comments (${requestScope["posts"].getCount()})</strong></a> <span>&nbsp;&bull;&nbsp;</span>  <span>&nbsp;&bull;&nbsp;</span> </p>
                </div>
                <div class="article">
                    <h2><span>${requestScope["posts"].getCount()}</span> Responses</h2>
                <c:forEach items='${requestScope["comments"]}' var="comment">
                    <div class="clr"></div>
                    <div class="comment"> <a href="#"><img src="images/userpic.gif" width="40" height="40" alt="" class="userpic" /></a>
                        <p><a  href="/users?action=view&id=${comment.getIdUsers()}"  name = "username">${comment.getUsername()}</a> Says:<br />
                    ${comment.getLastModifiedDate()}</p>
                        <p>${comment.getContents()}</p>
                    <c:if test="${requestScope['IdUserDB'] == comment.getIdUsers()}">
                        <%--<c:if test="${requestScope['role'] == 'user'}">--%>
                        <p>
                            <a href="/comments?action=edit&id=${comment.getId()}">Edit</a>|
                            <a href="/comments?action=delete&id=${comment.getId()}" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                        </p>
                    </c:if>
                    <c:if test="${requestScope['role'] == 'admin'}">
                        <p>
                                <%--<a href="/comments?action=edit&id=${comment.getId()}">Edit</a>|--%>
                            <a href="/comments?action=delete&id=${comment.getId()}" onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                        </p>
                    </c:if>
                    </div>
                </c:forEach>

                <%--<div class="comment"> <a href="#"><img src="images/userpic.gif" width="40" height="40" alt="" class="userpic" /></a>--%>
                        <%--<p><a href="#">Admin</a> Says:<br />--%>
                            <%--April 20th, 2009 at 3:21 pm</p>--%>
                        <%--<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</p>--%>
                    <%--</div>--%>
                    <%--<div class="comment"> <a href="#"><img src="images/userpic.gif" width="40" height="40" alt="" class="userpic" /></a>--%>
                        <%--<p><a href="#">admin</a> Says:<br />--%>
                            <%--April 20th, 2009 at 2:17 pm</p>--%>
                        <%--<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.</p>--%>
                    <%--</div>--%>
                </div>
                <div class="article">
                    <h2><span>Leave a</span> Reply</h2>
                    <div class="clr"></div>
                    <p style="color: red">
                        <c:if test='${requestScope["message"] != null}'>
                            <span class="message">${requestScope["message"]}</span>
                        </c:if>
                    </p>
                    <form action="/posts?action=createComment&id=${requestScope["posts"].getId()}" method="post" id="leavereply">
                        <ol>
                            <li>
                                <label for="message">Your Message</label>
                                <textarea id="message" name="content" rows="8" cols="50"></textarea>
                            </li>
                            <li>
                                <input type="image" name="imageField" id="imageField" src="images/submit.gif" class="send" />
                                <div class="clr"></div>
                            </li>
                        </ol>
                    </form>
                </div>
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
                        <%--<% for(Post c : list){%>--%>
                        <%--<li><a href="/home?action=<%=c.getNameCategories()%>"--%>
                        <%--title=""><%=c.getNameCategories()%></a></li>--%>
                        <%--<%}%>--%>
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
            <%--<div class="sidebar">--%>
                <%--<div class="searchform">--%>
                    <%--<form id="formsearch" name="formsearch" method="post" action="#">--%>
            <%--<span>--%>
            <%--<input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />--%>
            <%--</span>--%>
                        <%--<input name="button_search" src="images/search.gif" class="button_search" type="image" />--%>
                    <%--</form>--%>
                <%--</div>--%>
                <%--<div class="clr"></div>--%>
                <%--<div class="gadget">--%>
                    <%--<h2 class="star"><span>Sidebar</span> Menu</h2>--%>
                    <%--<div class="clr"></div>--%>
                    <%--<ul class="sb_menu">--%>
                        <%--<li><a href="#">Home</a></li>--%>
                        <%--<li><a href="#">TemplateInfo</a></li>--%>
                        <%--<li><a href="#">Style Demo</a></li>--%>
                        <%--<li><a href="#">Blog</a></li>--%>
                        <%--<li><a href="#">Archives</a></li>--%>
                        <%--<li><a href="#">Web Templates</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
                <%--<div class="gadget">--%>
                    <%--<h2 class="star"><span>Sponsors</span></h2>--%>
                    <%--<div class="clr"></div>--%>
                    <%--<ul class="ex_menu">--%>
                        <%--<li><a href="#">Lorem ipsum dolor</a><br />--%>
                            <%--Donec libero. Suspendisse bibendum</li>--%>
                        <%--<li><a href="#">Dui pede condimentum</a><br />--%>
                            <%--Phasellus suscipit, leo a pharetra</li>--%>
                        <%--<li><a href="#">Condimentum lorem</a><br />--%>
                            <%--Tellus eleifend magna eget</li>--%>
                        <%--<li><a href="#">Fringilla velit magna</a><br />--%>
                            <%--Curabitur vel urna in tristique</li>--%>
                        <%--<li><a href="#">Suspendisse bibendum</a><br />--%>
                            <%--Cras id urna orbi tincidunt orci ac</li>--%>
                        <%--<li><a href="#">Donec mattis</a><br />--%>
                            <%--purus nec placerat bibendum</li>--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>
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
