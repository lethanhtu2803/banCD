package com.demo.services;

import java.util.List;

import com.demo.DTO.UserDTO;
import com.demo.entities.User;

public interface UserService {
	public Iterable<User> findAll();
	public boolean checkLogin(String username, String password);
	public UserDTO findByUsername(String username);
}
