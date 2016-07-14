package org.up.user.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", type = "redirectAction", params = { "namespace", "/user", "actionName", "username",
		"username", "${user.getUsername()}" }), @Result(name = "input", location = "/user/profile.ftl") })
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		if (avatar == null)
			return INPUT;
		user.setAvatar(avatar);
		user.setBio(bio);
		user.setEmail(email);
		user.setNickname(nickname);
		user.setPhoneNumber(phoneNumber);
		userService.editUser(user);
		return SUCCESS;
	}

	@Override
	public void validate() {
		//addFieldError("test","test");
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		user = userService.loadUserByUsername(currentUsername);
		if (avatar != null) {
			if (!(userService.ifNicknameValid(nickname) || user.getNickname() == nickname || user.getNickname().equals(nickname))) {
				addFieldError("Nickname", "The nickname has been used!");
			}
			if (!(email == null ||userService.ifEmailValid(email) || user.getEmail() == email || user.getEmail().equals(email))) {
				addFieldError("Email", "The email has been used!");
			}
			if (!(phoneNumber == null || userService.ifPhoneNumberValid(phoneNumber) || user.getPhoneNumber() == phoneNumber || user.getPhoneNumber().equals(phoneNumber))) {
				addFieldError("Phone number", "The phone number has been used!");
			}
		}
	}
}
