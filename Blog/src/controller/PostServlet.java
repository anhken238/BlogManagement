package controller;

import model.Category;
import model.Comment;
import model.Post;
import model.User;
import service.category.CategoryImpl;
import service.category.ICategory;
import service.comment.CommentImpl;
import service.comment.IComment;
import service.post.IPost;
import service.post.PostImpl;
import service.user.IUser;
import service.user.UserImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
@MultipartConfig(fileSizeThreshold = 1024*1024*2 , maxFileSize = 1024*1024*10, maxRequestSize = 1024*1024*50)
@WebServlet(name = "PostServlet", urlPatterns = "/posts")
public class PostServlet extends HttpServlet {

    private IPost postDAO = new PostImpl();
    private IComment commentImpl = new CommentImpl();
    private ICategory categoryImpl = new CategoryImpl();
    private IUser userImpl = new UserImpl();
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createPost(request, response);
                break;
            case "createComment":
                createComment(request, response);
                break;
            case "edit":
                updatePost(request, response);
                break;
            default:
                break;
        }
    }
//add
    private void createComment(HttpServletRequest request, HttpServletResponse response) {

        String content = request.getParameter("content");
        session = request.getSession();
        String username = (String) session.getAttribute("Admin");
        if (username != null) {
                //change here bug Admin cant edit him comment ???
                User user = userImpl.getUserByUsername(username);
                String role = user.getRole();
                String roleUser = "admin";
                if (role.equals(roleUser) && user.getUsername().equals(roleUser)) {
                    request.setAttribute("role", role);
                } else {
                    request.setAttribute("IdUserDB", user.getId());
                }
            int idUser = userImpl.findIdByUsername(username);
            int id = Integer.parseInt(request.getParameter("id"));
            RequestDispatcher dispatcher;
            if (idUser != -1) {
                Comment comment = new Comment(content, idUser, id);
                this.commentImpl.createComment(comment);
                //            change
                int count = 0, count2 = 0;
                count = this.commentImpl.countComments(comment.getIdPosts());
                count2 = (count);
                Post post2 = this.postDAO.getPostById(comment.getIdPosts());
                post2.setCount(count2);
                this.postDAO.updateCount(comment.getIdPosts(), post2);
                //            change
                Post post = this.postDAO.getPostById(id);
                List<Comment> comments = this.commentImpl.getAllCommentOfPost_Username(id);
                List<Category> category = this.categoryImpl.getAllCategory();
                request.setAttribute("posts", post);
                request.setAttribute("comments", comments);
                request.setAttribute("categories", category);

                dispatcher = request.getRequestDispatcher("single.jsp");
                request.setAttribute("message", "New comments was created");

            } else {

                Post post = this.postDAO.getPostById(id);
                List<Comment> comments = this.commentImpl.getAllCommentOfPost_Username(id);
                List<Category> category = this.categoryImpl.getAllCategory();
                request.setAttribute("posts", post);
                request.setAttribute("comments", comments);
                request.setAttribute("categories", category);

                dispatcher = request.getRequestDispatcher("single.jsp");
                request.setAttribute("message", "You must login first");
            }
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            String message = "\n" +
                    "You must login !";
            try {
                response.sendRedirect("login.jsp?message=" + URLEncoder.encode(message, "UTF-8"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    private void updatePost(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String introduce = request.getParameter("introduce");
        String content = request.getParameter("content");
        //change to here

            Part part = null;
            try {
                part = request.getPart("file");
            } catch (IOException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            }
            String image = extractFileName(part);
            String imageDB = postDAO.getImageById(id);
            if(image.equals(imageDB) || image.equals("")){
                String savePath = "C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images" + File.separator + image;
                int categories = Integer.parseInt(request.getParameter("category"));
                session = request.getSession();
                String finalEditor = (String) session.getAttribute("Admin");
                int idUser = userImpl.findIdByUsername(finalEditor);
                Post post = this.postDAO.getPostById(id);
                RequestDispatcher requestDispatcher;
                post.setTitle(title);
                post.setIntroduce(introduce);
                post.setContent(content);
                post.setImage(imageDB);
                post.setPath(savePath);
                post.setIdCategories(categories);
                post.setIdUsers(idUser);
                post.setFinalEditor(finalEditor);
                this.postDAO.updatePost(id, post);
        }else {
                String savePath = "C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images" + File.separator + image;
//        File fileSaveDir = new File(savePath);
                try {
                    part.write(savePath + File.separator);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                int categories = Integer.parseInt(request.getParameter("category"));
                session = request.getSession();
                String finalEditor = (String) session.getAttribute("Admin");
                int idUser = userImpl.findIdByUsername(finalEditor);

                Post post = this.postDAO.getPostById(id);
                RequestDispatcher requestDispatcher;
                post.setTitle(title);
                post.setIntroduce(introduce);
                post.setContent(content);
                post.setImage(image);
                post.setPath(savePath);
                post.setIdCategories(categories);
                post.setIdUsers(idUser);
                post.setFinalEditor(finalEditor);
                this.postDAO.updatePost(id, post);
        }

        try {
            String message = "New post was updated";
            response.sendRedirect("posts?message=" + URLEncoder.encode(message, "UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }

}

private void createPost(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    response.setContentType("text/html; charset=UTF-8");
    String title = request.getParameter("title");
    String introduce = request.getParameter("introduce");
    String content = request.getParameter("content");
//    String image = request.getParameter("image");
    //change
    Part part = null;
    try {
        part = request.getPart("file");
    } catch (IOException e) {
        e.printStackTrace();
    } catch (ServletException e) {
        e.printStackTrace();
    }
    String image = extractFileName(part);
    String savePath = "C:\\Users\\Administrator\\Desktop\\MyProject\\Blog\\web\\images" + File.separator + image;
    File fileSaveDir = new File(savePath);
    try {
        part.write(savePath + File.separator);
    } catch (IOException e) {
        e.printStackTrace();
    }

    //change
    int categories = Integer.parseInt(request.getParameter("category"));
    String creator = (String) session.getAttribute("Admin");
    int idUser = userImpl.findIdByUsername(creator);
    /*        int user = Integer.parseInt(request.getParameter("user"));*/

    Post post = new Post(0, title, introduce, content, image, savePath, categories, idUser, creator);
    this.postDAO.createPost(post);
    try {
        String message = "New post was created";
        response.sendRedirect("posts?message=" + URLEncoder.encode(message, "UTF-8"));
    } catch (IOException e) {
        e.printStackTrace();
    }
}
    //with
    private String extractFileName(Part part){
        String contentDisp = part.getHeader("content-disposition");
        String[] iteams = contentDisp.split(";");
        for (String s : iteams){
            if(s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=") +2, s.length() -1);
            }
        }
        return "";
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "createComment":
                createComment(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                DeleteForm(request, response);
                break;
            case "view":
                viewPosts(request, response);
                break;
            default:
                listPosts(request, response);

                break;
        }
    }



    // show comment and post by id post.
    private void viewPosts(HttpServletRequest request, HttpServletResponse response) {

        int id = Integer.parseInt(request.getParameter("id"));
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("Admin");
        if(username != null) {
            //change here

            User user = userImpl.getUserByUsername(username);
            String role = user.getRole();
            String roleUser = "admin";
            if (role.equals(roleUser) && user.getUsername().equals(roleUser)) {
                request.setAttribute("role", role);
            } else {
                request.setAttribute("IdUserDB", user.getId());
            }
        }
            //change here
        Post post = this.postDAO.getPostById(id);
        List<Comment> comments = this.commentImpl.getAllCommentOfPost_Username(id);
        List<Category> category = this.categoryImpl.getAllCategory();
        request.setAttribute("posts", post);
        request.setAttribute("comments", comments);
        request.setAttribute("categories", category);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("single.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void DeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Post deletePost = this.postDAO.getPostById(id);
        this.postDAO.deletePost(deletePost);
        try {
            String message = " Post was deleted";
            response.sendRedirect("posts?message=" + URLEncoder.encode(message, "UTF-8"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Post existingPost = this.postDAO.getPostById(id);
        request.setAttribute("posts", existingPost);
        List<Category> categoryList = categoryImpl.getAllCategory();
        request.setAttribute("listCategory", categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Category> categoryList = categoryImpl.getAllCategory();
        request.setAttribute("listCategory", categoryList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listPosts(HttpServletRequest request, HttpServletResponse response) {
        List<Post> posts = this.postDAO.getAllPosts();
        request.setAttribute("posts", posts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("post/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

}
