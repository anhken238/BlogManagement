package com.brycen.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.brycen.model.Category;

@Service
public interface ICategoryService {
	  Iterable<Category> findAll();
	  Optional<Category>   findById(Long id);
	  void save(Category category);
	  void remove(Long id);
}
