package org.up.search.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.UserDto;
import org.up.user.service.IUserDtoService;
import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "/search/user.ftl"),
	@Result(name="input", location = "/search/index.ftl")})
public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String keyword;
	private List<UserDto> users;
	@Autowired
	IUserDtoService userDtoService;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<UserDto> getUsers() {
		return users;
	}

	public void setUsers(List<UserDto> users) {
		this.users = users;
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
		users = userDtoService.searchUserDtoByNickname(keyword, currentUsername);
		return SUCCESS;
	}
}
