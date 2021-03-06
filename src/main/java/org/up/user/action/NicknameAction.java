package org.up.user.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.UserDto;
import org.up.user.service.IUserDtoService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "/user/id.ftl"),
		@Result(name = "input", type = "httpheader", params = { "status", "404" }) })
public class NicknameAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String nickname;
	private UserDto user;
	@Autowired
	private IUserDtoService userDtoService;

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public UserDto getUser() {
		return user;
	}

	public void setUser(UserDto user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {

		return SUCCESS;
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
		try {
			user = userDtoService.loadUserDtoByNickname(nickname, currentUsername);
		} catch (Exception e) {
			addFieldError("User", "An error occured!");
		}
		if(user == null)addFieldError("User","We can not find the user with the specific nickname!");
	}
}
