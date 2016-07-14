package org.up.admin.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;

import com.opensymphony.xwork2.ActionSupport;

//@Results({ @Result(name = "success", type = "redirectAction", params={"namespace","/user","actionName","1"})})

public class DeleteUserAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private Long id;
	private User user;
	@Autowired
	private IUserService userService;
	@Autowired
	private IWeiboService weiboService;

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
		
		//删除所有关注信息
		
		List<Weibo> weibos = weiboService.getWeiboByUsername(currentUsername);
		
		//然后遍历weibos，删除所有点赞和评论
		
		weiboService.deleteAllWeiboByUsername(currentUsername);//删除所有微博
		
		
		userService.deleteUser(user);//最后删除用户
		return SUCCESS;
	}
}