package com.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.util.MimeTypeUtils;

import com.demo.DTO.UserDTO;
import com.demo.entities.User;
import com.demo.services.UserService;
@Controller

@RequestMapping("api/user")




public class UserController {
	@Autowired
	private UserService userService;
	@GetMapping(value = "findAll", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Iterable<User>> findAll(){
		try {
			return new ResponseEntity<Iterable<User>>(userService.findAll(), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Iterable<User>>(HttpStatus.BAD_REQUEST);
		}
	}
	@PostMapping(value = "login", produces = MimeTypeUtils.APPLICATION_JSON_VALUE, consumes = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> checkLogin(@RequestBody UserDTO userDTO){
		try {
			return new ResponseEntity<Object>(new Object() {
				public String msg = userService.checkLogin(userDTO.getUsername(), userDTO.getPassword()) ? "Ban da dang nhap thanh cong" : "Ban dang nhap that bai";
				public boolean status = userService.checkLogin(userDTO.getUsername(), userDTO.getPassword());
			}, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	@GetMapping(value = "findByUsername/{username}", produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserDTO> findByUsername(@PathVariable("username") String username){
		try {
			return new ResponseEntity<UserDTO>(userService.findByUsername(username), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<UserDTO>(HttpStatus.BAD_REQUEST);
		}
	}
}
