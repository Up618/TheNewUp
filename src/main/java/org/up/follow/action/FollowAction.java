package org.up.follow.action;

import com.opensymphony.xwork2.ActionSupport;
import org.up.model.User;
import org.up.user.service.IUserService;
import org.up.follow.service.IFollowService;
import org.up.model.Follow;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Results({ @Result(name = "success", type = "redirectAction", location = "index"),
		@Result(name = "input", type = "redirectAction", location = "get-follow") })
public class FollowAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String followusername;
	
	@Autowired
	private IFollowService followService;
	
	@Autowired
	private IUserService userService;
	@Override
	public String execute() throws Exception {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String myname=null;
		if (principal instanceof UserDetails) {
			myname = ((UserDetails)principal).getUsername();
		} else {
			myname = principal.toString();
		}
		Follow follow = new Follow();
		User userfollowing = userService.loadUserByUsername(myname);
		User userfollowed = userService.loadUserByUsername(followusername);
		follow.setFollowed(userfollowed);
		follow.setFollowing(userfollowing);
		try{
			followService.addFollow(follow);
		}catch(Exception e){
			return INPUT;
		}
		return SUCCESS;
	}
	private void setFollowusername(String followusername){
		this.followusername = followusername;
	}
	
	private String getFollowusername(){
		return this.followusername;
	}
}
