package org.up.follow.action;

import com.opensymphony.xwork2.ActionSupport;

import org.up.model.Follow;
import org.up.follow.service.IFollowService;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

public class DeleteFollow extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String followusername;
	
	@Autowired
	private IFollowService followService;
	
	@Autowired

	@Override
	public String execute() throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String myname=null;
		if (principal instanceof UserDetails) {
			myname = ((UserDetails)principal).getUsername();
		} else {
			myname = principal.toString();
		}
		Follow follow = followService.getFollow(myname, followusername);
		followService.deleteFollow(follow);
		return SUCCESS;
	}
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getUsername(){
		return this.username;
	}
	
	public void setFollowusername(String followusername){
		this.followusername = followusername;
	}
	
	public String getFollowusername(){
		return this.followusername;
	}
}
