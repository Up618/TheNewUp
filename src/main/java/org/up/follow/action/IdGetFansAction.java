package org.up.follow.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.up.dto.UserDto;
import org.up.follow.service.IFollowService;
import org.up.model.Follow;
import org.up.model.User;
import org.up.user.service.IUserDtoService;
import org.up.user.service.IUserService;

import com.opensymphony.xwork2.ActionSupport;

@Action(value = "*-get-fans", params = { "id", "{1}" })
@Results({ @Result(name = "success", location = "fans.ftl")})
public class IdGetFansAction extends ActionSupport{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Follow> listFollow;
	private List<List> fans;
	private String message;
	private String username;
	private Long fansAmount;
	private Long followAmount;
	private Long id;
	private Integer page = 1;
	private UserDto user;
	private Integer pageNum;
	@Autowired
	private IFollowService followService;
	@Autowired
	private IUserService userService;
	@Autowired
	private IUserDtoService userDtoService;

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
		user = userService.loadUserById(id);
		fansAmount = user.getFansAmount();
		followAmount = user.getFollowAmount();
		fans = followService.getFansById(id,myname);
		this.user = userDtoService.loadUserDtoById(id, myname);
		pageNum = fans.size()/10;
		if(pageNum == 0 )
			pageNum = 1;
		return SUCCESS;
	}
	
	public void setPage(Integer page){
		this.page = page;
	}
	public Integer getPage(){
		return this.page;
	}
	public void setPageNum(Integer pageNum){
		this.pageNum = pageNum;
	}
	public Integer getPageNum(){
		return this.pageNum;
	}
	public void setUser(UserDto user){
		this.user = user;
	}
	
	public UserDto getUser(){
		return this.user;
	}
	public void setId(Long id){
		this.id = id;
	}
	
	public Long getId(){
		return this.id;
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
	
	public void setFans(List<List> fans){
		this.fans = fans;
	}
	
	public List<List> getFans(){
		return this.fans;
	}
}
