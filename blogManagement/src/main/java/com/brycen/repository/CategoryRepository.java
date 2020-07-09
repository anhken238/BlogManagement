package com.brycen.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.brycen.model.Category;
@Repository
public interface CategoryRepository extends PagingAndSortingRepository<Category, Long> {
}