package com.brycen.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.brycen.model.User;
@Repository
public interface UserRepository extends JpaRepository<User,Long> {

}
