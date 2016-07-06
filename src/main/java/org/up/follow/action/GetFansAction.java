package org.up.follow.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.follow.service.IFollowService;
import org.up.model.Follow;
import org.up.model.User;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Results({ @Result(name = "success", location = "fans.ftl")})
public class GetFansAction extends ActionSupport{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Follow> listFollow;
	private List<User> fans;
	private String message;
	private String username;
	private Long fansAmount;
	private Long followAmount;
	@Autowired
	private IFollowService followService;
	@Autowired
	private IUserService userService;
	@Override
	public String execute() throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String myname=null;
		if (principal instanceof UserDetails) {
			myname = ((UserDetails)principal).getUsername();
		} else {
			myname = principal.toString();
		}	
		User user = new User();
		user = userService.loadUserByUsername(myname);
		listFollow = followService.findByFollowUsername(myname);
		fansAmount = user.getFansAmount();
		followAmount = user.getFollowAmount();
		fans = followService.findFansByUsername(myname);
		return SUCCESS;
	}
	
	public void setFansAmount(Long fansAmount){
		this.fansAmount = fansAmount;
	}
	
	public Long getFansAmount(){
		return this.fansAmount;
	}
	
	public void setFollowAmount(Long followAmount){
		this.followAmount = followAmount;
	}
	
	public Long getFollowAmount(){
		return this.followAmount;
	}
	public void setMessage(String message){
		this.message = message;
	}
	
	public String getMessage(){
		return message;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setListFollow(List<Follow> listFans){
		this.listFollow = listFans;
	}
	
	public List<Follow> getListFollow(){
		return this.listFollow;
	}
	
	public void setFans(List<User> fans){
		this.fans = fans;
	}
	
	public List<User> getFans(){
		return this.fans;
	}
}
