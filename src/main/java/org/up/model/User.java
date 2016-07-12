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
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(unique = true, nullable = false, length = 20)
	private String username;
	@Column(nullable = false)
	private String passwordHash;
	@Column(unique = true, length = 50)
	private String email;
	@Column(unique = true, length = 20)
	private String phoneNumber;
	private String bio;
	@Column(unique = true, nullable = false, length = 20)
	private String nickname;
	@Column(columnDefinition = "VARCHAR(255) NOT NULL DEFAULT \'http://o8m79d0cw.bkt.clouddn.com/my-java.jpg\'")
	private String avatar = "http://o8m79d0cw.bkt.clouddn.com/my-java.jpg";
	private String profileBackground;
	private String pageBackground;
	private Boolean gender; // Female if true
	private Boolean phoneNumberConfirm = false;
	private Boolean emailConfirm = false;
	private Boolean isPublic = true;
	@Column(columnDefinition = "TIMESTAMP NOT NULL DEFAULT NOW()")
	private Timestamp createTime = new Timestamp(System.currentTimeMillis());
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
	private List<Comment> comments;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Agree> agrees;
	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<CommentLike> commentLikes;

	@Formula("(select count(*) from weibo as w where w.user_id = id)")
	private Long weiboAmount;

	@Formula("(select count(*) from follow as f where f.following_id = id)")
	private Long followAmount;

	@Formula("(select count(*) from follow as f where f.followed_id = id)")
	private Long fansAmount;
	
	@Formula("(select count(*) from agree as a where a.user_id = id)")
	private Long likedWeiboAmount;

	public Long getLikedWeiboAmount() {
		return likedWeiboAmount;
	}

	public void setLikedWeiboAmount(Long likedWeiboAmount) {
		this.likedWeiboAmount = likedWeiboAmount;
	}

	public Long getFansAmount() {
		return this.fansAmount;
	}

	public void setFansAmount(Long fansAmount) {
		this.fansAmount = fansAmount;
	}

	public Long getFollowAmount() {
		return this.followAmount;
	}

	public void setFollowAmount(Long followAmount) {
		this.followAmount = followAmount;
	}

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

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
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

	public List<CommentLike> getCommentLikes() {
		return commentLikes;
	}

	public void setCommentLikes(List<CommentLike> commentLikes) {
		this.commentLikes = commentLikes;
	}

	public Long getWeiboAmount() {
		return weiboAmount;
	}

	public void setWeiboAmount(Long weiboAmount) {
		this.weiboAmount = weiboAmount;
	}

	public String getProfileBackground() {
		return profileBackground;
	}

	public void setProfileBackground(String profileBackground) {
		this.profileBackground = profileBackground;
	}

	public String getPageBackground() {
		return pageBackground;
	}

	public void setPageBackground(String pageBackground) {
		this.pageBackground = pageBackground;
	}
}
