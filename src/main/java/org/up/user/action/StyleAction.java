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
		"username", "${user.getUsername()}" }), @Result(name = "input", location = "/user/style.ftl") })
public class StyleAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String profileBackground;
	private String pageBackground;
	private User user;
	@Autowired
	private IUserService userService;

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
		if (user == null)
			return INPUT;
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		user = userService.loadUserByUsername(currentUsername);
		user.setPageBackground(pageBackground);
		user.setProfileBackground(pageBackground);
		userService.editUser(user);
		return SUCCESS;
	}

}
