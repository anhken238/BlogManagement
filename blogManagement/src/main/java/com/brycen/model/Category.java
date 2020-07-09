package com.brycen.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="categories")
public class Category {
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
private Long id;
private String nameCategory;

public Category() {
}

@OneToMany(mappedBy = "category",cascade=CascadeType.ALL, fetch = FetchType.LAZY)
private Set<com.brycen.model.Post> posts;


public Category(String nameCategory) {
    this.nameCategory = nameCategory;
}


public Long getId() {
	return id;
}


public void setId(Long id) {
	this.id = id;
}


public String getNameCategory() {
	return nameCategory;
}


public void setNameCategory(String nameCategory) {
	this.nameCategory = nameCategory;
}


public Set<com.brycen.model.Post> getPosts() {
	return posts;
}


public void setPosts(Set<com.brycen.model.Post> posts) {
	this.posts = posts;
}

}
