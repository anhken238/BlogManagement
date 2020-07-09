package com.brycen.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brycen.model.User;
import com.brycen.repository.UserRepository;
import com.brycen.service.IUserService;

public class UserServiceImpl implements IUserService{
 @Autowired UserRepository userRepository;

@Override
public Iterable<User> findAll() {
	// TODO Auto-generated method stub
	return userRepository.findAll();
}

@Override
public void save(User user) {
	// TODO Auto-generated method stub
	userRepository.save(user);
}

@Override
public void remove(Long id) {
	// TODO Auto-generated method stub
	userRepository.deleteById(id);
}

@Override
public Optional<User> findById(Long id) {
	// TODO Auto-generated method stub
	return null;
}
	

}
