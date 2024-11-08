package com.demo.entities;
// Generated Nov 8, 2024, 3:46:28 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.*;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "user", catalog = "music_store")
public class User implements java.io.Serializable {

	private Integer id;
	private String fullName;
	private String username;
	private String password;
	private String email;
	private String securityCode;
	private Integer status;
	private Set<DeliveryInfo> deliveryInfos = new HashSet<DeliveryInfo>(0);
	private Set<Order> orders = new HashSet<Order>(0);

	public User() {
	}

	public User(String fullName, String username, String password, String email, String securityCode, Integer status,
			Set<DeliveryInfo> deliveryInfos, Set<Order> orders) {
		this.fullName = fullName;
		this.username = username;
		this.password = password;
		this.email = email;
		this.securityCode = securityCode;
		this.status = status;
		this.deliveryInfos = deliveryInfos;
		this.orders = orders;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "full_name", length = 100)
	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	@Column(name = "username", length = 50)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", length = 100)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "security_code", length = 20)
	public String getSecurityCode() {
		return this.securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<DeliveryInfo> getDeliveryInfos() {
		return this.deliveryInfos;
	}

	public void setDeliveryInfos(Set<DeliveryInfo> deliveryInfos) {
		this.deliveryInfos = deliveryInfos;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

}
