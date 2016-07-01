package org.up.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.role.service.IRoleService;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", type = "redirectAction", location = "Index"),
		@Result(name = "input", type = "redirectAction", location = "Login") })
public class RegisterAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;
	private String passwordAgain;
	private String nickname;

	@Autowired
	IUserService userService;

	@Autowired
	IRoleService roleService;

	@Override
	public String execute() throws Exception {
		User user = new User();
		user.setNickname(nickname);
		user.setRole(roleService.loadRoleById((long) 1));
		user.setUsername(username);
		user.setPasswordHash(password);
		try {
			userService.addUser(user);
		} catch (Exception e) {
			return INPUT;
		}
		return SUCCESS;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordAgain() {
		return passwordAgain;
	}

	public void setPasswordAgain(String passwordAgain) {
		this.passwordAgain = passwordAgain;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public void validate() {
		if (password != passwordAgain) {
			addFieldError("passwordAgain", "The two passwords are not the same.");
		}
	}

}
