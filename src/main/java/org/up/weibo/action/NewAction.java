package org.up.weibo.action;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.opensymphony.xwork2.ActionSupport;

@Results({@Result(name="success",type="redirectAction",params={"namespace","/","actionName","index"})})
public class NewAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String content;
	
	@Autowired
	private IWeiboService weiboService;
	
	@Autowired
	private IUserService userService;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String execute() throws Exception {
		Weibo weibo = new Weibo();
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		User user = userService.loadUserByUsername(currentUsername);
		weibo.setUser(user);
		weibo.setContent(content);
		weiboService.addWeibo(weibo);
		return SUCCESS;
	}
}
