package com.brycen.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


@Entity
@Table(name="posts")
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	 private int id;
	    private String introduce;
	    private String title;
	    private String content;
	    private String image;
	    private String path;
	    private String creator;
	    
	    @Temporal(TemporalType.TIMESTAMP)
	    @Column(updatable = false)
	    @CreationTimestamp
	    private Date dateCreated;
	    private String finalEditor;
	    
	    @Temporal(TemporalType.TIMESTAMP)
	    @UpdateTimestamp
	    private Date lastModifiedDate;
	    private int idCategories;
	    private int idUsers;
	    private String nameCategories;
	    private int count;
	    public Post() {}
	    
	    
	    @ManyToOne
	    @JoinColumn(name = "category_id")
	    private Category category;

	    @ManyToOne
	    @JoinColumn(name = "user_id")
	    private User user;

	    
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
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
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
		public int getCount() {
			return count;
		}
		public void setCount(int count) {
			this.count = count;
		}
	    
}
