package org.up.action;

import java.sql.Timestamp;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "login.ftl") })
public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;

	@Autowired
	IUserService userService;

	@Override
	public String execute() throws Exception {
		try {
			User user = userService.loadUserByUsername(username);
			user.setLastLogin(new Timestamp(System.currentTimeMillis()));
			userService.editUser(user);
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

}
