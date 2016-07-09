package org.up.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Formula;

@Entity
public class Weibo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP")
	private Timestamp time = new Timestamp(System.currentTimeMillis());
	@Column(nullable = false)
	private String content;
	@ManyToOne
	private User user;
	@ManyToOne
	private Location location;
	@OneToMany(mappedBy = "weibo", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Comment> comments;
	@OneToMany(mappedBy = "weibo", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Agree> agrees;
	@OneToMany(mappedBy = "weibo", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Picture> pictures;
	
	@Formula("(select count(*) from picture as p where p.weibo_id = id)")
	private Long pictureAmount;
	//微博点赞数计数。和Service中的操作本质是一样的，加在实体中，供前端页面调用。
	@Formula("(select count(*) from agree as a where a.weibo_id = id)")
	private Long agreeAmount;
	
	public Long getAgreeAmount() {
		return agreeAmount;
	}

	public void setAgreeAmount(Long agreeAmount) {
		this.agreeAmount = agreeAmount;
	}

	public Long getPictureAmount() {
		return pictureAmount;
	}

	public void setPictureAmount(Long pictureAmount) {
		this.pictureAmount = pictureAmount;
	}

	public List<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Agree> getAgrees() {
		return agrees;
	}

	public void setAgrees(List<Agree> agrees) {
		this.agrees = agrees;
	}
}
