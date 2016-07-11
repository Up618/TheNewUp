package org.up.dto;

import org.up.model.User;

public class UserDto {

	private User user;
	private Boolean following;
	private Boolean follower;
	private Boolean isMe;
	
	public UserDto(User user, Boolean following, Boolean follower, Boolean isMe) {
		super();
		this.user = user;
		this.following = following;
		this.follower = follower;
		this.isMe = isMe;
	}
	
	public UserDto(User user, String following,String follower,String isMe) {
		super();
		this.user = user;
		this.following = new Boolean(following);
		this.follower = new Boolean(follower);
		this.isMe = new Boolean(isMe);
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
	public void setIsMe(Boolean isMe){
		this.isMe = isMe;
	}	
	public Boolean getIsMe(){
		return this.isMe;
	}

}
