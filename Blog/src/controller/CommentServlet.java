package controller;

import model.Comment;
import model.Post;
import model.User;
import service.comment.CommentImpl;
import service.comment.IComment;
import service.post.IPost;
import service.post.PostImpl;
import service.user.Hashing;
import service.user.IUser;
import service.user.UserImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@WebServlet(name = "CommentServlet", urlPatterns = "/comments")
public class CommentServlet extends HttpServlet {

    private IComment commentImpl = new CommentImpl();
    //private IPost postImpl = new PostImpl();
    private IUser userImpl = new UserImpl();
    private Hashing hash = new Hashing();
    HttpSession session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {

            case "edit":
                try {
                    updateComment(request, response);
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                }
                break;

            case "listByIdUserOrPost":
                listCommentByIdUserOrPost(request, response);
                break;

            default:
                break;
        }
    }


    private void updateComment(HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        HttpSession session = request.getSession();
        String username = String.valueOf(session.getAttribute("Admin"));
        User user = userImpl.getUserByUsername(username);
        int id = Integer.parseInt(request.getParameter("id"));
        String content = request.getParameter("contents");
         Comment comment = new Comment(id, content);
         Comment commentDB = this.commentImpl.getCommentById(id);
         int IdPOST = commentDB.getIdPosts();
        this.commentImpl.updateComment(comment);

        if(user.getRole().equals("admin")) {
            try {
                String message = "comment was update";
                response.sendRedirect("comments?message=" + URLEncoder.encode(message, "UTF-8"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            String message = "comment was update";
            try {
                response.sendRedirect("posts?action=view&id="+ IdPOST);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                DeleteForm(request, response);
                break;
            case "view":
                showViewForm(request, response);
                break;

            case "listByIdUser":
                listCommentByIdUser(request, response);
                break;
            case "listByIdUserOrPost":
                listCommentByIdUserOrPost(request, response);
                break;
            default:
                listComment(request, response);
                break;
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Comment comment = commentImpl.getCommentById(id);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/view.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void DeleteForm(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int id = Integer.parseInt(request.getParameter("id"));
        Comment comment = commentImpl.getCommentById(id);
        this.commentImpl.deleteComment(comment);
        String username = (String) session.getAttribute("Admin");
        User user = userImpl.getUserByUsername(username);
        int IdPOST = comment.getIdPosts();

//change xoa comment
        IPost postDAO = new PostImpl();
        int count = 0, count2 = 0;
        count = this.commentImpl.countComments(comment.getIdPosts());
        count2 = (count --);
        Post post2 = postDAO.getPostById(comment.getIdPosts());
        post2.setCount(count2);
        postDAO.updateCount(comment.getIdPosts(), post2);


        if(user.getRole().equals("admin")) {
            try {
                String message = "comment was deleted";
                response.sendRedirect("comments?message=" + URLEncoder.encode(message, "UTF-8"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            String message = "comment was deleted";
            try {
                response.sendRedirect("posts?action=view&id="+IdPOST);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Comment comment = commentImpl.getCommentById(id);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/edit.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("single.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listComment(HttpServletRequest request, HttpServletResponse response) {
        List<Comment> comments = this.commentImpl.getAllComment();
        request.setAttribute("comments", comments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/list.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listCommentByIdUserOrPost(HttpServletRequest request, HttpServletResponse response) {
        String searchComment = request.getParameter("viewByIdPost");//viewByIdPost
        List<Comment> comments = this.commentImpl.getAllCommentByUserOrPost(searchComment);
        request.setAttribute("comments", comments);


        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/listByIdPost.jsp");//comment/listByIdPost.jsp
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void listCommentByIdUser(HttpServletRequest request, HttpServletResponse response) {
        int idUser = Integer.parseInt(request.getParameter("viewByIdUser"));
        List<Comment> comments = this.commentImpl.getAllCommentOfUser(idUser);
        request.setAttribute("comments", comments);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment/listByIdUser.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
