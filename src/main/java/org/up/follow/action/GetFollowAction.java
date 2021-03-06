package org.up.follow.action;

import java.util.HashMap;
import java.util.List;

import org.up.dto.UserDto;
import org.up.follow.service.IFollowService;
import org.up.model.Follow;

import org.up.model.User;
import org.up.user.service.IUserDtoService;
import org.up.user.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Action(value = "*-get-follow/get-follow", params = { "id", "{1}" })
@Results({ @Result(name = "success", location = "getfollow.ftl")})
public class GetFollowAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Follow> listFollow;
	@SuppressWarnings("rawtypes")
	private List<List> users;
	private HashMap<User,String> userMap;
	private String username;
	private Long followAmount;
	private Long fansAmount;
	private List<User> userinfo;
	private Long id;
	private UserDto user;
	private Integer page = 1;
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
		followAmount = user.getFollowAmount();
		fansAmount = user.getFansAmount();
		users = followService.getFollowById(id,myname,page,10);
		this.user = userDtoService.loadUserDtoById(id, myname);
		pageNum = (int) ((user.getFollowAmount()-1)/10 + 1);
		return SUCCESS;
	}
	
	public void setPageNum(Integer pageNum){
		this.pageNum = pageNum;
	}
	public Integer getPageNum(){
		return this.pageNum;
	}
	public void setPage(Integer page){
		this.page = page;
	}
	public Integer getPage(){
		return this.page;
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
	@SuppressWarnings("rawtypes")
	public List<List> getUsers(){
		return this.users;
	}
	
	@SuppressWarnings("rawtypes")
	public void setUsers(List<List> users){
		this.users = users;
	}
	
	public void setUserinfo(List<User> userinfo){
		this.userinfo = userinfo;
	}
	
	public List<User> getUserinfo(){
		return this.userinfo;
	}
	public HashMap<User, String> getUserMap(){
		return this.userMap;
	}
	
	public void setUserMap(HashMap<User,String> userMap){
		this.userMap = userMap;
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
