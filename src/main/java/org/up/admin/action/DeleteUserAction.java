package org.up.admin.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

//@Results({ @Result(name = "success", type = "redirectAction", params={"namespace","/user","actionName","1"})})

public class DeleteUserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Long id;
	private User user;
	@Autowired
	private IUserService userService;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
		userService.deleteUser(user);
		return SUCCESS;
	}
}