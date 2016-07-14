package org.up.admin.action;

import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.user.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;

@Result(name = "success", type = "json")

public class BanUserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Long user_id;
	@Autowired
	private IUserService userService;

	@Override
	public String execute() throws Exception {
		user_id = getUser_id();

		User user = userService.loadUserById(user_id);
		if (user.getRole().getId() == 1)
			userService.banUserById(user_id);
		else
			userService.unbanUserById(user_id);

		return SUCCESS;
	}

	public Long getUser_id() {
		return user_id;
	}

	public void setUser_id(Long user_id) {
		this.user_id = user_id;
	}
}