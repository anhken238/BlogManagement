package com.brycen.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.brycen.model.Post;
@Service
public interface IPostService {
	 	 Iterable<Post> findAll();
	 	 Optional<Post>   findById(Long id);
	 	 Post save(Post post);
	 	 void remove(Long id);
}
