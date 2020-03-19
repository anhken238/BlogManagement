package model;

import javax.servlet.http.Part;
import java.sql.Date;

public class Post {
    private int id;
    private String introduce;
    private String title;
    private String content;
    private String image;
    private String path;
    private String creator;
    private Date dateCreated;
    private String finalEditor;
    private Date lastModifiedDate;
    private int idCategories;
    private int idUsers;
    private String nameCategories;
    private int count;

    public Post() {
    }
    public Post(int id,String title, int count){
        this.id = id;
        this.title = title;
        this.count = count;
    }

    public Post(int id, String title, String introduce){
        this.id = id;
        this.title = title;
        this.introduce = introduce;
    }

    public Post(int id, String title, String introduce, String content, String image, String creator,
                Date dateCreated,int count, String finalEditor, Date lastModifiedDate, int idCategories, int idUsers, String nameCategories){
        this.id = id;
        this.introduce = introduce;
        this.title = title;
        this.content = content;
        this.image = image;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.count = count;
        this.finalEditor = finalEditor;
        this.lastModifiedDate = lastModifiedDate;
        this.idCategories = idCategories;
        this.idUsers = idUsers;
        this.nameCategories = nameCategories;
    }

    public Post(int id, String title, String introduce, String content, String image, int idCategories,
                int idUsers, String creator) {
        this.id = id;
        this.introduce = introduce;
        this.title = title;
        this.content = content;
        this.image = image;
        this.idCategories = idCategories;
        this.idUsers = idUsers;
        this.creator = creator;

    }

    public Post(int id, String title, String introduce, String content, String image, int idCategories,
                String finalEditor) {
        this.id = id;
        this.introduce = introduce;
        this.title = title;
        this.content = content;
        this.image = image;
        this.idCategories = idCategories;
        this.finalEditor = finalEditor;
    }

    public Post(int id, String title, String introduce,String image, String creator, Date dateCreated, int idCategories, String nameCategories){
        this.id = id;
        this.title = title;
        this.introduce = introduce;
        this.image = image;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.idCategories = idCategories;
        this.nameCategories = nameCategories;
    }
    //uploand image
    public Post(int id, String  title , String introduce, String content, String image, String path, int idCategories, int idUsers, String creator) {
        this.id = id;
        this.introduce = introduce;
        this.title = title;
        this.content = content;
        this.image = image;
        this.path = path;
        this.creator = creator;
        this.idCategories = idCategories;
        this.idUsers = idUsers;
    }

    public Post(int id, String image, String title, String introduce, int count) {
        this.id = id;
        this.introduce = image;
        this.title = title;
        this.image = introduce;
        this.count = count;
    }

    public Post(int id, String title, String introduce, String image, String creator, Date dateCreated, int idCategories, int count) {
        this.id = id;
        this.title =title;
        this.introduce = introduce;
        this.image = image;
        this.creator = creator;
        this.dateCreated = dateCreated;
        this.idCategories = idCategories;
        this.count = count;
    }


    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getFinalEditor() {
        return finalEditor;
    }

    public void setFinalEditor(String finalEditor) {
        this.finalEditor = finalEditor;
    }

    public Date getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Date lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public int getIdCategories() {
        return idCategories;
    }

    public void setIdCategories(int idCategories) {
        this.idCategories = idCategories;
    }

    public int getIdUsers() {
        return idUsers;
    }

    public void setIdUsers(int idUsers) {
        this.idUsers = idUsers;
    }

    public String getNameCategories() {
        return nameCategories;
    }

    public void setNameCategories(String nameCategories) {
        this.nameCategories = nameCategories;
    }


}
