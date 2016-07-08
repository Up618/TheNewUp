package org.up.dto;

import org.up.model.User;

public class UserDto {
	private String username;
	private String nickname;
	private Long followAmount;
	private Long fansAmount;
	private Long weiboAmount;
	private boolean followed;
	private boolean following;
	private User user;

	public UserDto(String username, String nickname, Long followAmount, Long fansAmount, Long weiboAmount,
			boolean followed) {
		this.username = username;
		this.nickname = nickname;
		this.followAmount = followAmount;
		this.fansAmount = fansAmount;
		this.weiboAmount = weiboAmount;
		this.followed = followed;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return this.username;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getNickname() {
		return this.nickname;
	}

	public void setFollowaAmount(Long followAmount) {
		this.followAmount = followAmount;
	}

	public Long getFollowAmount() {
		return this.followAmount;
	}

	public void setFansAmount(Long fansAmount) {
		this.fansAmount = fansAmount;
	}

	public Long getFansAmount() {
		return this.fansAmount;
	}

	public void setWeiboAmount(Long weiboAmount) {
		this.weiboAmount = weiboAmount;
	}

	public Long getWeiboAmount() {
		return this.weiboAmount;
	}

	public void setFollowed(boolean followed) {
		this.followed = followed;
	}

	public boolean getFollowed() {
		return this.followed;
	}

	public void setFollowing(boolean following) {
		this.following = following;
	}

	public boolean getFollowing() {
		return this.following;
	}
}
