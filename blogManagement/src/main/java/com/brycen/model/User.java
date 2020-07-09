package com.brycen.model;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

//    @NotEmpty
//    @Size(min = 6)
    private String name;

//    @NotEmpty
//    @Size(min = 6)
    private String password;

    public User() {
    }

    @OneToMany(mappedBy = "user")
    private Set<com.brycen.model.Post> posts;



//    public User(@NotEmpty @Size(min = 6) String name, @NotEmpty @Size(min = 6) String password) {
//        this.name = name;
//        this.password = password;
//    }
    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Set<com.brycen.model.Post> getPosts() {
		return posts;
	}



	public void setPosts(Set<com.brycen.model.Post> posts) {
		this.posts = posts;
	}
    
    
}