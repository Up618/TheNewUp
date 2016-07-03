package org.up.search.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "/search/user.ftl"),
	@Result(name="input", location = "/search/index.ftl")})
public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String keyword;
	private List<User> users;
	@Autowired
	IUserService userService;

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	@Override
	public String execute() throws Exception {
		users = userService.searchUserByNickname(keyword);
		return SUCCESS;
	}
}
