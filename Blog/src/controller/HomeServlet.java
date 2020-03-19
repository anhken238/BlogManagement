package controller;

import model.Category;
import model.Post;
import service.category.CategoryImpl;
import service.category.ICategory;
import service.comment.CommentImpl;
import service.comment.IComment;
import service.post.IPost;
import service.post.PostImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {

    private IPost postDAO = new PostImpl();
    private ICategory categoryImpl = new CategoryImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "search":
                showSearchResult(request, response);
                break;
            default:
                listEverything(request, response);
                break;
        }
    }
    private void showSearchResult(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("search");
        List<Post> searchResult = this.postDAO.getSearchResults(keyword);
        if(searchResult.size() != 0) {
            request.setAttribute("result", searchResult);
            request.setAttribute("a",keyword);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
        else {
            String message = "\n" +
                    "Result is not found !!!...";
            try {
                response.sendRedirect("home?message=" + URLEncoder.encode(message, "UTF-8"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryImpl categoryDao = new CategoryImpl();
        List<Category> nameCategoryDB = categoryDao.getNameCategory();
        String action = (request.getParameter("action"));
        if(action == null){
            listEverything(request, response);
        }
        else {
            showPostByCategory(request, response);
        }

    }

    private void showPostByCategory(HttpServletRequest request, HttpServletResponse response){
//        set size neu co thi truyen den trang co. neu size ko co thi truyen den trang tam thoi chua co bai viet.
//        int idCategory = Integer.parseInt(request.getParameter("action"));
        int idCategory = Integer.parseInt(request.getParameter("action"));
        List<Post>  postByCategory = this.postDAO.getPostByCategory(idCategory);
        if(postByCategory.size()>0) {
            request.setAttribute("idCategory", idCategory);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pageCategory.jsp");
            try {
                requestDispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
        else {
            request.setAttribute("updating","Coming son !....");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("pageCategory.jsp");
        }
    }


    private void showPythonCategory(HttpServletRequest request, HttpServletResponse response) {
        List<Post> postByCategory = this.postDAO.getAllPostsByCategory(4);
        request.setAttribute("postByCategory", postByCategory);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("python.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showJavaCategory(HttpServletRequest request, HttpServletResponse response) {
        List<Post> postByCategory = this.postDAO.getAllPostsByCategory(2);
        request.setAttribute("postByCategory", postByCategory);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("java_page.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showJsCategory(HttpServletRequest request, HttpServletResponse response) {
        List<Post> postByCategory = this.postDAO.getAllPostsByCategory(1);
        request.setAttribute("postByCategory", postByCategory);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("javascript_page.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void listEverything(HttpServletRequest request, HttpServletResponse response) {
        List<Category> allCategories = this.categoryImpl.getAllCategory();
        List<Post> allPosts = new ArrayList<>();
        for (int i = 0; i < allCategories.size(); i++) {
            try {
                Post post = this.postDAO.getLatestPostByCategory(allCategories.get(i).getId());
                allPosts.add(post);
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("allPosts", allPosts);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        //RequestDispatcher requestDispatcher1 = request.getRequestDispatcher("javascript_page.jsp");
        try {
            requestDispatcher.forward(request, response);
            //requestDispatcher1.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }


}
