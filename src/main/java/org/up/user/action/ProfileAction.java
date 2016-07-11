package org.up.user.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", type = "redirectAction", params = { "namespace", "/user", "actionName", "*", "id",
		"${user.getId()}" }), @Result(name = "input", location = "/user/profile.ftl") })
public class ProfileAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private String phoneNumber;
	private String bio;
	private String nickname;
	private String avatar;
	private String profileBackground;
	private String pageBackground;
	private User user;
	@Autowired
	private IUserService userService;

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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		user = userService.loadUserByUsername(currentUsername);
		if (avatar == null)
			return INPUT;
		user.setAvatar(avatar);
		user.setBio(bio);
		user.setEmail(email);
		user.setNickname(nickname);
		user.setPhoneNumber(phoneNumber);
		user.setPageBackground(pageBackground);
		user.setProfileBackground(profileBackground);
		userService.editUser(user);
		return SUCCESS;
	}
}
