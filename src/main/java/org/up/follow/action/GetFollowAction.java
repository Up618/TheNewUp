package org.up.follow.action;

import java.util.ArrayList;
import java.util.List;

import org.up.follow.service.IFollowService;
import org.up.model.Follow;

import org.up.model.User;
import org.up.user.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Results({ @Result(name = "success", location = "follow.ftl")})
public class GetFollowAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Follow> listFollow;
	private List<User> users;
	private String username;
	
	private Long followAmount;
	private Long fansAmount;
	
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
		listFollow = followService.findByUsername(myname);
		followAmount = user.getFollowAmount();
		fansAmount = user.getFansAmount();
		users = followService.findFollowUserByUserName(myname);
		return SUCCESS;
	}
	
	public List<User> getUsers(){
		return this.users;
	}
	
	public void setUsers(List<User> users){
		this.users = users;
	}
	
	public Long getFollowAmount(){
		return this.followAmount;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setListFollow(List<Follow> listFollow){
		this.listFollow = listFollow;
	}
	
	public List<Follow> getListFollow(){
		return this.listFollow;
	}
	
	public Long getFansAmount(){
		return this.fansAmount;
	}
	
	public void setFansAmount(Long fansAmount){
		this.fansAmount = fansAmount;
	}
}
