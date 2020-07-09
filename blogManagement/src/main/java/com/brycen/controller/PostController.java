package com.brycen.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.brycen.model.Post;
import com.brycen.repository.PostRepository;
import com.brycen.service.IPostService;

@RestController
@RequestMapping({"/posts"})

public class PostController {
	@Autowired
	private IPostService postService;
//
//	public PostController() {
//		this.postService = postService;
//	}

	// show list posts
	@GetMapping
	public Iterable findAll() {
		return postService.findAll();
	}

	// get post by id
	@GetMapping(path = "/{id}")
	public ResponseEntity<Post> findById(@PathVariable long id) {
		return postService.findById(id).map(record -> ResponseEntity.ok().body(record))
				.orElse(ResponseEntity.notFound().build());
	}

	// create post
	@PostMapping
	public Post create(@RequestBody Post post) {
		return postService.save(post);
	}

	// update post
	@PutMapping(value = "/{id}")
	public ResponseEntity<Post> update(@PathVariable("id") long id, @RequestBody Post post) {
		return postService.findById(id).map(record -> {
			record.setTitle(post.getTitle());
			record.setIntroduce(post.getIntroduce());
			record.setContent(post.getContent());
//			record.setImage(post.getImage());
//			record.setCreator(post.getCreator());
//			record.setFinalEditor(post.getFinalEditor());
//			record.setLastModifiedDate(post.getLastModifiedDate());
//			record.setNameCategories(post.getNameCategories());
			record.setCount(post.getCount());
			Post updated = postService.save(record);
			return ResponseEntity.ok().body(updated);
		}).orElse(ResponseEntity.notFound().build());
	}

	@DeleteMapping(path = "{/id}")
	public ResponseEntity<?> delete(@PathVariable("id") long id) {
		return postService.findById(id).map(record -> {
			postService.remove(id);
			return ResponseEntity.ok().build();
		}).orElse(ResponseEntity.notFound().build());
	}
}
