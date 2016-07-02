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

@Entity
public class User {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(unique = true, nullable = false, length = 20)
	private String username;
	@Column(nullable = false)
	private String passwordHash;
	@Column(unique = true, length = 50)
	private String email;
	@Column(unique = true, length = 20)
	private String phoneNumber;
	private String signature;
	@Column(unique = true, nullable = false, length = 20)
	private String nickname;
	@Column(columnDefinition = "VARCHAR(255) NOT NULL DEFAULT \'http://o8m79d0cw.bkt.clouddn.com/my-java.jpg\'")
	private String avatar;
	private Boolean gender; // Female if true
	private Boolean phoneNumberConfirm = false;
	private Boolean emailConfirm = false;
	private Boolean isPublic = true;
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT NOW()")
	private Timestamp createTime;
	private Timestamp lastLogin;
	@OneToMany(mappedBy = "following", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Follow> followings;
	@OneToMany(mappedBy = "followed", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Follow> followers;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Weibo> weibos;
	@ManyToOne
	private Role role;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Picture> pictures;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Comment> comments;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Agree> agrees;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CommentLike> commentLikes;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPasswordHash() {
		return passwordHash;
	}

	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Boolean getPhoneNumberConfirm() {
		return phoneNumberConfirm;
	}

	public void setPhoneNumberConfirm(Boolean phoneNumberConfirm) {
		this.phoneNumberConfirm = phoneNumberConfirm;
	}

	public Boolean getEmailConfirm() {
		return emailConfirm;
	}

	public void setEmailConfirm(Boolean emailConfirm) {
		this.emailConfirm = emailConfirm;
	}

	public Boolean getIsPublic() {
		return isPublic;
	}

	public void setIsPublic(Boolean isPublic) {
		this.isPublic = isPublic;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Timestamp lastLogin) {
		this.lastLogin = lastLogin;
	}

	public List<Follow> getFollowings() {
		return followings;
	}

	public void setFollowings(List<Follow> followings) {
		this.followings = followings;
	}

	public List<Follow> getFollowers() {
		return followers;
	}

	public void setFollowers(List<Follow> followers) {
		this.followers = followers;
	}

	public List<Weibo> getWeibos() {
		return weibos;
	}

	public void setWeibos(List<Weibo> weibos) {
		this.weibos = weibos;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Picture> getPictures() {
		return pictures;
	}

	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Agree> getagrees() {
		return agrees;
	}

	public void setagrees(List<Agree> agrees) {
		this.agrees = agrees;
	}

	public List<CommentLike> getCommentLikes() {
		return commentLikes;
	}

	public void setCommentLikes(List<CommentLike> commentLikes) {
		this.commentLikes = commentLikes;
	}
}
