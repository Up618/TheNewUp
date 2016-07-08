package org.up.agree.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.annotations.Formula;
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

//@Results({ @Result(name = "success", type = "redirectAction", params={"namespace","/user","actionName","1"})})
//1处应该是user_id，暂且用1代替
@Results({ @Result(name = "success", type = "json") })
//返回一个json对象给前端，可以调取其中的属性参数

@Action("agree")
@SuppressWarnings("serial")
public class AgreeAction extends ActionSupport {

	/**
	 * 微博的点赞操作
	 */

	private Long weibo_id; // 接收前段传来的weibo_id
	private boolean ifLiked; // 创建一个变量判断是否被点赞过，供前端调取
	// private Long agreeAmount; //有朝一日可能用得到的点赞数

	public boolean isIfLiked() {
		return ifLiked;
	}

	public void setIfLiked(boolean ifLiked) {
		this.ifLiked = ifLiked;
	}

	public Long getWeibo_id() {
		return weibo_id;
	}

	public void setWeibo_id(Long weibo_id) {
		this.weibo_id = weibo_id;
	}

	/*
	  public Long getAgreeAmount() { 
	  	return agreeAmount; 
	  }
	  
	  public void setAgreeAmount(Long agreeAmount) { 
	  	this.agreeAmount = agreeAmount; 
	  }
	*/

	/**
	 * 获取Service对象
	 */
	@Autowired
	private IAgreeService agreeService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IWeiboService weiboService;

	@Override
	public String execute() throws Exception {

		Agree agree = new Agree();
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}

		weibo_id = getWeibo_id();
		// agreeAmount = agreeService.countAgreeAmountByWeiboId(weibo_id);
		System.out.println(currentUsername);// 调试语句
		System.out.println(weibo_id);
		// System.out.println(agreeAmount);
		agree = agreeService.loadAgreeByWeiboAndUser(weibo_id, currentUsername);// 获取对应微博id、用户id的赞

		if (agree != null)
			ifLiked = true; // 获得了agree实体，已经被点赞过
		else
			ifLiked = false;

		if (ifLiked) {
			agreeService.cancelAgree(agree); // 被点赞过，取消点赞
		} else {
			Agree agree2 = new Agree();
			Weibo weibo = weiboService.loadWeiboById(weibo_id);
			User user = userService.loadUserByUsername(currentUsername);
			agree2.setUser(user);
			agree2.setWeibo(weibo);
			agreeService.addAgree(agree2); // 新增点赞
		}
		return SUCCESS;
	}
}
