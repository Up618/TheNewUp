package org.up.comment.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.up.comment.service.ICommentService;
import org.up.model.Comment;
import org.up.model.CommentLike;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import com.opensymphony.xwork2.ActionSupport;
//@Action(value = "*", params = { "id", "{1}"})
//@Results({ @Result(name = "success", location = "/commentTest/comment.ftl")})
//@Action(value = "comment", results = {
//		@Result(name = "success", type = "json", params = { "excludeProperties", "passwordHash", "encoding", "UTF-8" }) })
@Action(value = "comment", results = {
		@Result(name = "success", type = "json") })

public class CommentAction extends ActionSupport {
	/**
	 * @author yuhui
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Weibo weibo;
	private List<Comment> comments;
	private Long weibo_id;
	private String json = "[";
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IWeiboService weiboService;
	
	@Autowired
	private IUserService userService;

	public Long getWeibo_id() {
		return weibo_id;
	}

	public void setWeibo_id(Long weibo_id) {
		this.weibo_id = weibo_id;
	}
	
	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}
	
	public Weibo getWeibo() {
		return weibo;
	}

	public void setWeibo(Weibo weibo) {
		this.weibo = weibo;
	}
	
	public List<Comment> getComments(){
		return comments;
	}
	
	public void setComments(List<Comment> comments){
		this.comments = comments;
	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("执行方法");
		weibo_id = getWeibo_id();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String myname=null;
		if (principal instanceof UserDetails) {
			myname = ((UserDetails)principal).getUsername();
		} else {
			myname = principal.toString();
		}	
		User user = new User();
		user = userService.loadUserByUsername(myname);
		System.out.println("user: "+user.getNickname());
		System.out.println("weibo_id: "+weibo_id);
		Weibo weibo = weiboService.loadWeiboById(weibo_id);
		comments = commentService.getCommentByWeibo(weibo);
		System.out.println("执行方法3");
		
		for(int i = 0; i < comments.size(); i++){
			  json += "{\"nickname\":\""+comments.get(i).getUser().getNickname()+"\",";
			  json += "\"id\":\""+comments.get(i).getId()+"\",";
			  json += "\"content\":\""+comments.get(i).getContent()+"\",";
			  json += "\"time\":\""+comments.get(i).getTime()+"\",";
			  json += "\"avatar\":\""+comments.get(i).getUser().getAvatar()+"\"}";
			  if(i != comments.size() - 1)
				  json +=",";
			}
		json +="]";

		System.out.println("执行方法5");
		setComment(json);
		System.out.println(json);
		System.out.println("执行方法6");
		return SUCCESS;
	}
	
	//下面是json的内容了
	public void setComment(String json){
		this.json = json;		
	}
}
