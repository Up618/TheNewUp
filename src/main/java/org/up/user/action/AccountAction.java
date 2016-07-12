package org.up.user.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", type = "redirectAction", params = { "namespace", "/", "actionName", "logout" }),
		@Result(name = "input", location = "/user/account.ftl") })
public class AccountAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String oldPassword;
	private String password;
	private String passwordAgain;
	private User user;
	@Autowired
	private IUserService userService;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String execute() throws Exception {
		if(password==null)return INPUT;
		user.setPasswordHash(password);
		userService.editUser(user);
		return super.execute();
	}

	public String getPasswordAgain() {
		return passwordAgain;
	}

	public void setPasswordAgain(String passwordAgain) {
		this.passwordAgain = passwordAgain;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	@Override
	public void validate() {
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		user = userService.loadUserByUsername(currentUsername);
		if(oldPassword!=null||password!=null||passwordAgain!=null){
			if(oldPassword!=user.getPasswordHash())addFieldError("Old password","Wrong old password!");
			if(password!=passwordAgain)addFieldError("Password Again","The two passwords are not the same!");
		}
	}
	
}
