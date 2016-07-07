package org.up.weibo.action;

import java.sql.Timestamp;
import java.util.List;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.model.Picture;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.picture.service.IPictureService;
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
	private List<String> urls;
	
	@Autowired
	private IWeiboService weiboService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IPictureService pictureService;

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
		if(urls==null)return SUCCESS;
		for(String url:urls){
			Picture pic = new Picture();
			pic.setPath(url);
			pic.setTime(new Timestamp(System.currentTimeMillis()));
			pic.setWeibo(weibo);
			pictureService.addPicture(pic);
		}
		return SUCCESS;
	}

	public List<String> getUrls() {
		return urls;
	}

	public void setUrls(List<String> urls) {
		this.urls = urls;
	}
}
