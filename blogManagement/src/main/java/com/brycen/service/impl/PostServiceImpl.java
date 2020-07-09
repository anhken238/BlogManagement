package com.brycen.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brycen.model.Post;
import com.brycen.repository.CategoryRepository;
import com.brycen.repository.PostRepository;
import com.brycen.service.IPostService;
@Service
public class PostServiceImpl implements IPostService{
	@Autowired PostRepository postRepository ;

	@Override
	public Iterable<Post> findAll() {
		// TODO Auto-generated method stub
		return postRepository.findAll();
	}

	@Override
	public Optional<Post> findById(Long id) {
		// TODO Auto-generated method stub
		return postRepository.findById(id);
	}

	@Override
	public Post save(Post post) {
		// TODO Auto-generated method stub
		return postRepository.save(post);
	}

	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		postRepository.deleteById(id);
	}
	
	

}
