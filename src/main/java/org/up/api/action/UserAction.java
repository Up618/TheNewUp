package org.up.api.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.UserDto;
import org.up.user.service.IUserDtoService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", type = "json", params = { "excludeProperties", "user.user.passwordHash,user.user.role,user.user.weibos,user.user.agrees,user.user.comments,user.user.commentLikes,user.user.agrees,user.user.followers,user.user.followings", "encoding",
		"UTF-8" }) })
public class UserAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private IUserDtoService userDtoService;
	private UserDto user;

	@Override
	public String execute() throws Exception {
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		user = userDtoService.loadUserDtoByUsername(currentUsername);
		return SUCCESS;
	}

	public UserDto getUser() {
		return user;
	}

	public void setUser(UserDto user) {
		this.user = user;
	}
}
