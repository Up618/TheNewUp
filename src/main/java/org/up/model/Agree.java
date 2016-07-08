package org.up.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Formula;

@Entity
public class Agree {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP")
	private Timestamp time;
	@ManyToOne
	private User user;
	@ManyToOne
	private Weibo weibo;
	
	/*
	
	private Long weibo_id;
	//private Long user_id;
	
	//@Formula("(select count(*) from agree as a where a.weibo_id = weibo_id and a.user_id = user_id)")
	private boolean ifLiked;

	public boolean isIfLiked() {
		return ifLiked;
	}

	public void setIfLiked(boolean ifLiked) {
		this.ifLiked = ifLiked;
	}
	 */
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Weibo getWeibo() {
		return weibo;
	}

	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}
}
