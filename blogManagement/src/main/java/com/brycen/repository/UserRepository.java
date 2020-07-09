package com.brycen.repository;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.brycen.model.User;
@Repository
public interface UserRepository extends PagingAndSortingRepository<User,Long> {

}
