package com.brycen.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brycen.model.Category;
import com.brycen.repository.CategoryRepository;
import com.brycen.service.ICategoryService;


public class CategoryServiceImpl implements ICategoryService {
	@Autowired CategoryRepository categoryRepository;

	@Override
	public Iterable<Category> findAll() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}

	@Override
	public Optional<Category> findById(Long id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}

	@Override
	public void save(Category category) {
		// TODO Auto-generated method stub
		categoryRepository.save(category);
	}

	@Override
	public void remove(Long id) {
		// TODO Auto-generated method stub
		categoryRepository.deleteById(id);
		
	}
	

}
