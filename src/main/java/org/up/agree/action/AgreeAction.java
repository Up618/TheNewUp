package org.up.agree.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import com.opensymphony.xwork2.ActionSupport;

import org.up.model.Agree;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.agree.service.IAgreeService;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;

@Results({ @Result(name = "success", type="redirectAction", params={"namespace","/user","actionName","2"})})

@Actions({ @Action(value = "*", params = { "id", "{1}" }),
	@Action(value = "*/weibo", params = { "id", "{1}" }) })
@SuppressWarnings("serial")
public class AgreeAction extends ActionSupport {
	
	/**
	 * 新增点赞
	 */
	
	private Long weibo_id;

	/**
	 * 获取Service对象
	 */
	@Autowired
	private IAgreeService agreeService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IWeiboService weiboService;
	
	public Long getWeibo_id() {
		return weibo_id;
	}

	public void setWeibo_id(Long weibo_id) {
		this.weibo_id = weibo_id;
	}

	@SuppressWarnings("null")
	@Override
	public String execute() throws Exception{
		
		
		Agree agree = new Agree();
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}
		
		weibo_id = getWeibo_id();
		System.out.println(weibo_id);
		System.out.println(currentUsername);
		Weibo weibo = weiboService.loadWeiboById(weibo_id);
		User user = userService.loadUserByUsername(currentUsername);
		agree = agreeService.loadAgreeByWeiboAndUser(weibo_id, currentUsername);
		//System.out.println("ifLiked is " + liked);
		if(agree != null) {
			agreeService.cancelAgree(agree); //被点赞过，取消点赞
		}
		else {
			Agree agree2 = new Agree();
			agree2.setUser(user);
			agree2.setWeibo(weibo);
			agreeService.addAgree(agree2); //新增点赞
		}
		return SUCCESS;
	}
}
