package com.demo.services;

import java.util.List;
import org.modelmapper.TypeToken;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.demo.DTO.UserDTO;
import com.demo.entities.User;
import com.demo.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ModelMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	@Override
	public Iterable<User> findAll() {
		return mapper.map(userRepository.findAll(), new TypeToken<List<UserDTO>>() {}.getType());
	}

	@Override
	public boolean checkLogin(String username, String password) {
		User user = userRepository.findByUserName(username);
		if(user != null) {
			return encoder.matches(password, user.getPassword());
		}
		return false;
	}

	@Override
	public UserDTO findByUsername(String username) {
		return mapper.map(userRepository.findByUserName(username), UserDTO.class);
	}
	
}
