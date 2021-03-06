package org.up.agree.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.UserDto;
import org.up.model.User;
import org.up.user.service.IUserDtoService;

import com.opensymphony.xwork2.ActionSupport;

/*
 * 赞过的微博Action
 * 高度复用 ./user/action/IdAction.java
 * 除了执行的Action名及跳转不同，其余完全相同
 * 本Action作用在于获得用户，获得微博见LikedWeiboAction.java
 */

@Actions({ @Action(value = "*-liked-weibo", params = { "id", "{1}" }) })
@Results({ @Result(name = "success", location = "/user/likedweibo.ftl") })
public class IdLikedWeiboAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Long id;
	private UserDto user;
	@Autowired
	private IUserDtoService userDtoService;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public UserDto getUser() {
		return user;
	}

	public void setUser(UserDto user) {
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
		user = userDtoService.loadUserDtoById(id, currentUsername);
		if(user.getUser().getUsername().equals(currentUsername)){
			user.setIsMe(true);
		}else{
			user.setIsMe(false);
		}
		return SUCCESS;
	}
}