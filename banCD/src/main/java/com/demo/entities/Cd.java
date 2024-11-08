package com.demo.entities;
// Generated Nov 8, 2024, 3:46:28 PM by Hibernate Tools 4.3.6.Final

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.*;

/**
 * Cd generated by hbm2java
 */
@Entity
@Table(name = "cd", catalog = "music_store")
public class Cd implements java.io.Serializable {

	private Integer id;
	private Artist artist;
	private Genre genre;
	private String title;
	private BigDecimal price;
	private Date releaseDate;
	private Integer stock;
	private String description;
	private Boolean status;
	private Set<Orderdetails> orderdetailses = new HashSet<Orderdetails>(0);

	public Cd() {
	}

	public Cd(Artist artist, Genre genre, String title, BigDecimal price, Date releaseDate, Integer stock,
			String description, Boolean status, Set<Orderdetails> orderdetailses) {
		this.artist = artist;
		this.genre = genre;
		this.title = title;
		this.price = price;
		this.releaseDate = releaseDate;
		this.stock = stock;
		this.description = description;
		this.status = status;
		this.orderdetailses = orderdetailses;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "artist_id")
	public Artist getArtist() {
		return this.artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "genre_id")
	public Genre getGenre() {
		return this.genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	@Column(name = "title", length = 100)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "price", precision = 10)
	public BigDecimal getPrice() {
		return this.price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "release_date", length = 10)
	public Date getReleaseDate() {
		return this.releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	@Column(name = "stock")
	public Integer getStock() {
		return this.stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	@Column(name = "description", length = 65535)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "status")
	public Boolean getStatus() {
		return this.status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cd")
	public Set<Orderdetails> getOrderdetailses() {
		return this.orderdetailses;
	}

	public void setOrderdetailses(Set<Orderdetails> orderdetailses) {
		this.orderdetailses = orderdetailses;
	}

}