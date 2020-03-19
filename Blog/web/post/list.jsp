
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" charset="utf-8">
    <title>List posts</title>
    <meta charset="utf-8">
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dda777;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <h3 class="navbar-brand" href="#">Posts</h3>
    </nav><br>
    <p>${param.message}</p>
    <%--<p>--%>
        <%--<c:if test='${requestScope["message"] != null}'>--%>
            <%--<span class="message">${requestScope["message"]}</span>--%>
        <%--</c:if>--%>
    <%--</p>--%>
    <ul class="nav nav-pills flex-column">
        <li class="nav-item">
            <a href="/admin.jsp" class="nav-link bg-secondary"  style="color: aliceblue;">Back to admin page</a><br>
        </li>
    </ul>
</div>
<table border="1">
    <tr>
        <th>Title</th>
        <th>Introduce</th>
        <th>Image</th>
        <th>Creator</th>
        <th>Date created</th>
        <th>Final editor</th>
        <th>Last modified date</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${requestScope['posts']}" var="post">
        <tr>
            <td><a href="/posts?action=view&id=${post.getId()}">${post.getTitle()}</a></td>
            <td>${post.getIntroduce()}</td>
            <%--<td>${post.getImage()}</td>--%>
            <td><image src="/images/${post.getImage()}"></image></td>
            <td>${post.getCreator()}</td>
            <td>${post.getDateCreated()}</td>
            <td>${post.getFinalEditor()}</td>
            <td>${post.getLastModifiedDate()}</td>
            <td><a href="/posts?action=edit&id=${post.getId()}">Edit</a></td>
            <td><a href="/posts?action=delete&id=${post.getId()}"  onclick="return confirm('Are you sure you want to delete?')">Delete</a></td>

        <%--<td><a href="/posts?action=delete&id=${post.getId()}"  onclick="return confirm('Are you sure you want to delete?')">Delete</a></td>--%>
        </tr>
    </c:forEach>
</table>
<p >
    <a href="/posts?action=create" type="button" class="btn btn-success" style="margin-left: 13px;margin-top: 11px;"> Create new post</a>
</p>

</body>
</html>
