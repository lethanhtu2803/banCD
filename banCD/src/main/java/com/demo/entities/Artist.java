package com.demo.entities;
// Generated Nov 8, 2024, 3:46:28 PM by Hibernate Tools 4.3.6.Final

import java.util.HashSet;
import java.util.Set;
import jakarta.persistence.*;


/**
 * Artist generated by hbm2java
 */
@Entity
@Table(name = "artist", catalog = "music_store")
public class Artist implements java.io.Serializable {

	private Integer id;
	private String name;
	private String genre;
	private String country;
	private String description;
	private Boolean status;
	private Set<Cd> cds = new HashSet<Cd>(0);

	public Artist() {
	}

	public Artist(String name, String genre, String country, String description, Boolean status, Set<Cd> cds) {
		this.name = name;
		this.genre = genre;
		this.country = country;
		this.description = description;
		this.status = status;
		this.cds = cds;
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

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "genre", length = 50)
	public String getGenre() {
		return this.genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Column(name = "country", length = 50)
	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "artist")
	public Set<Cd> getCds() {
		return this.cds;
	}

	public void setCds(Set<Cd> cds) {
		this.cds = cds;
	}

}