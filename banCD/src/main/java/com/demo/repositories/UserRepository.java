package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.User;
@Repository
public interface UserRepository extends CrudRepository<User, Integer>{
	@Query("from User where username = :username") //HQL
	
//	@Query(value = "SELECT * FROM user WHERE username = :username", nativeQuery = true)
//	List<User> findByUsername(@Param("username") String username); // sql 
	public User findByUserName(@Param("username") String username);
}
