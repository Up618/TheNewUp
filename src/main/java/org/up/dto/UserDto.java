package org.up.dto;

import org.up.model.User;

public class UserDto {

	private User user;
	private Boolean following;
	private Boolean follower;
	
	public UserDto(User user, Boolean following, Boolean follower) {
		super();
		this.user = user;
		this.following = following;
		this.follower = follower;
	}
	
	public UserDto(User user, String following,String follower) {
		super();
		this.user = user;
		this.following = new Boolean(following);
		this.follower = new Boolean(follower);
	}

	public UserDto(User user) {
		super();
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Boolean getFollowing() {
		return following;
	}

	public void setFollowing(Boolean following) {
		this.following = following;
	}

	public Boolean getFollower() {
		return follower;
	}

	public void setFollower(Boolean follower) {
		this.follower = follower;
	}

}
