package org.up.api.action;

import java.sql.Timestamp;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {

	@Action(value = "user", results = {
			@Result(name = "success", type = "json", params = { "excludeProperties", "passwordHash", "encoding", "UTF-8" }) })
	@Override
	public String execute() throws Exception {
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		User user = userService.loadUserByUsername(currentUsername);
		setAction(user);
		return SUCCESS;
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String username;
	private String passwordHash;
	private String email;
	private String phoneNumber;
	private String signature;
	private String nickname;
	private String avatar;
	private Boolean gender;
	private Boolean phoneNumberConfirm;
	private Boolean emailConfirm;
	private Boolean isPublic;
	private Timestamp createTime;
	private Timestamp lastLogin;
	private Long weiboAmount;

	@Autowired
	private IUserService userService;

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

	public Long getWeiboAmount() {
		return weiboAmount;
	}

	public void setWeiboAmount(Long weiboAmount) {
		this.weiboAmount = weiboAmount;
	}

	private void setAction(User user) {
		this.avatar = user.getAvatar();
		this.createTime = user.getCreateTime();
		this.email = user.getEmail();
		this.emailConfirm = user.getEmailConfirm();
		this.gender = user.getGender();
		this.id = user.getId();
		this.isPublic = user.getIsPublic();
		this.lastLogin = user.getLastLogin();
		this.nickname = user.getNickname();
		this.passwordHash = user.getPasswordHash();
		this.phoneNumber = user.getPhoneNumber();
		this.phoneNumberConfirm = user.getPhoneNumberConfirm();
		this.signature = user.getSignature();
		this.username = user.getUsername();
		this.weiboAmount = user.getWeiboAmount();
	}
}
