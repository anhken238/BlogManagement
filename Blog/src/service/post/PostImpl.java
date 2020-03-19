package service.post;

import model.ConnectDatabase;
import model.Post;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostImpl implements IPost {

    Connection connection = ConnectDatabase.getConnection();
    Statement statement = null;
    PreparedStatement preparedStatement = null;
    String sql = null;
    ResultSet resultSet;

    //chane uploand image
    @Override
    public void createPost(Post post) {
        sql = "insert into posts (title, introduce, content, image,path, idCategories, idUsers, creator)" +
                "values (?, ?, ?, ?, ?, ?, ?,?)";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getIntroduce());
            preparedStatement.setString(3, post.getContent());
            preparedStatement.setString(4, post.getImage());
            preparedStatement.setString(5,post.getPath());
            preparedStatement.setInt(6, post.getIdCategories());
            preparedStatement.setInt(7, post.getIdUsers());
            preparedStatement.setString(8, post.getCreator());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Post getPostById(int id) {
        Post post = null;
        sql = "select posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id "+
                "where posts.id = ?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int count = resultSet.getInt("count");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idCategories = resultSet.getInt("idCategories");
                int idUsers = resultSet.getInt("idUsers");
                String nameCategories = resultSet.getString("nameCategories");
                post = new Post(id, title, introduce, content, image, creator, dateCreated,count, finalEditor,
                        lastModifiedDate, idCategories, idUsers, nameCategories);

                resultSet.close();
                preparedStatement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    @Override
    public List<Post> getAllPosts() {
        List<Post> listPosts = new ArrayList<>();
        sql = "select posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id ";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String content = resultSet.getString("content");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int count = resultSet.getInt("count");
                String finalEditor = resultSet.getString("finalEditor");
                Date lastModifiedDate = resultSet.getDate("lastModifiedDate");
                int idCategories = resultSet.getInt("idCategories");
                int idUsers = resultSet.getInt("idUsers");
                String nameCategories = resultSet.getString("nameCategories");
                Post post = new Post(id, title, introduce, content, image, creator, dateCreated,count, finalEditor,
                        lastModifiedDate, idCategories, idUsers, nameCategories);


                listPosts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listPosts;
    }

    @Override
    public List<Post> getListByPage(List<Post> postList, int start, int end) {
        List<Post> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(postList.get(i));
        }
        return list;
    }
    @Override
    public List<Post> getAllPostsByCategory(int idCategory) {
        List<Post> posts = new ArrayList<>();
        sql = "select posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id " +
                "where categories.id = " + idCategory + " order by dateCreated DESC";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int idCategories = resultSet.getInt("idCategories");
                String nameCategories = resultSet.getString("nameCategories");

                Post post = new Post(id, title, introduce,image, creator, dateCreated, idCategories, nameCategories);
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }

    @Override
    public List<Post> getSearchResults(String keyword) {
        List<Post> searchResult = new ArrayList<>();
        sql = "select id,title,introduce,image,creator,dateCreated,idCategories,count from posts where title like '%" + keyword + "%';";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int idCategories = resultSet.getInt("idCategories");
                int count = resultSet.getInt("count");
                Post post = new Post(id, title, introduce,image, creator, dateCreated, idCategories,count);

                searchResult.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchResult;
    }

    @Override
    public Post getLatestPostByCategory(int idCategory) {
        Post latestPost = null;
        sql = "SELECT posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id " +
                "where categories.id = " + idCategory +
                " order by posts.dateCreated DESC limit 1;";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int idCategories = resultSet.getInt("idCategories");
                String nameCategories = resultSet.getString("nameCategories");


                latestPost = new Post(id, title, introduce,image, creator, dateCreated, idCategories, nameCategories);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return latestPost;
    }

    @Override
    public void updatePost(int id, Post post) {
        sql = "update posts set title = ?, introduce = ?, content = ?, image = ?, path = ?, idCategories = ?, idUsers = ?, finalEditor = ?,lastModifiedDate = NOW() " +
                "where id = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, post.getTitle());
            preparedStatement.setString(2, post.getIntroduce());
            preparedStatement.setString(3, post.getContent());
            preparedStatement.setString(4, post.getImage());
            preparedStatement.setString(5,post.getPath());
            preparedStatement.setInt(6, post.getIdCategories());
            preparedStatement.setInt(7, post.getIdUsers());
            preparedStatement.setString(8, post.getFinalEditor());
            preparedStatement.setInt(9, post.getId());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getImageById(int id) {
        sql = "select image from posts where id=" + id + ";";
        String imageByIdPost = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            if (resultSet.next()) {
                imageByIdPost = resultSet.getString("image");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return imageByIdPost;
    }

    @Override
    public void deletePost(Post post) {
        sql = "delete from posts where id = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, post.getId());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCount(int idPost, Post post) {
        sql = "update posts set count = ?  " +
                "where id = ?";
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, post.getCount());
            preparedStatement.setInt(2, post.getId());
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Post> topPosts() {
        List<Post> postsTop = new ArrayList<>();
        sql = "select * from posts order by count desc limit 5";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int count = resultSet.getInt("count");
                Post postTop = new Post(id,title, count);
                postsTop.add(postTop);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postsTop;
    }

    @Override
    public List<Post> getPostByCategory(int idCategory) {
        List<Post> postByNameCategory = new ArrayList<>();
        sql = "SELECT posts.*, categories.nameCategories " +
                "FROM blog.posts " +
                "inner join categories " +
                "on posts.idCategories = categories.id " +
                "where categories.id = " + idCategory + "";
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String introduce = resultSet.getString("introduce");
                String image = resultSet.getString("image");
                String creator = resultSet.getString("creator");
                Date dateCreated = resultSet.getDate("dateCreated");
                int idCategories = resultSet.getInt("idCategories");
                int count = resultSet.getInt("count");
                Post postOne = new Post(id, title, introduce,image, creator, dateCreated, idCategories,count);
                postByNameCategory.add(postOne);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postByNameCategory;
    }
}
