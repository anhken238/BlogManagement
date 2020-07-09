package com.brycen.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.brycen.model.User;

@Service
public interface IUserService {
	Iterable<User> findAll();
	void save(User user);
	void remove(Long id);
	Optional<User> findById(Long id);
}
