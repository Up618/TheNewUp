package org.up.admin.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 管理员查看用户的Action。管理员端因为不需要判断是否本人，用的用户实体是User。
 */

//@Action(value = "*/user", params = { "id", "{1}" })
//@Result(name = "success", location = "/admin/user.ftl")

public class ViewUserAction  extends ActionSupport {
	
	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1L;


	private Integer page = 1;
	private List<User> users;
	@Autowired
	private IUserService userService;


	public String execute() throws Exception {
		users = userService.listAllUsers(page, 10);
		return SUCCESS;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

}
