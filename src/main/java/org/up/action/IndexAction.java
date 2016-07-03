package org.up.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "index.ftl")})
public class IndexAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private Long weiboAmount;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IWeiboService weiboService;

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
		weiboAmount = weiboService.countWeiboByUser(user);
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getWeiboAmount() {
		return weiboAmount;
	}

	public void setWeiboAmount(Long weiboAmount) {
		this.weiboAmount = weiboAmount;
	}
}
