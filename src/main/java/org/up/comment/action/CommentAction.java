package org.up.comment.action;

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
import org.up.model.User;
import org.up.model.Weibo;
import org.up.user.service.IUserService;
import org.up.weibo.service.IWeiboService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import com.opensymphony.xwork2.ActionSupport;
//@Action(value = "*", params = { "id", "{1}"})
//@Results({ @Result(name = "success", location = "/commentTest/comment.ftl")})
@Action(value = "comment", results = {
		@Result(name = "success", type = "json", params = { "excludeProperties", "passwordHash", "encoding", "UTF-8" }) })
public class CommentAction extends ActionSupport {
	/**
	 * @author yuhui
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Weibo weibo;
	private Comment comment;
	private List<Comment> comments;
	private Long weibo_id;
	private String c;
	
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
	
	public String getC(){
		return c;
	}
	
	public void setC(String c){
		this.c = c;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
    	weibo_id = Long.valueOf(request.getParameter("weibo_id"));
    	weibo_id = 1L;
    	
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String myname=null;
		if (principal instanceof UserDetails) {
			myname = ((UserDetails)principal).getUsername();
		} else {
			myname = principal.toString();
		}	
		User user = new User();
		user = userService.loadUserByUsername(myname);
		System.out.println("执行方法");
		System.out.println("user: "+user.getNickname());
		
		System.out.println("weibo_id: "+weibo_id);
		
		Weibo weibo = weiboService.loadWeiboById(weibo_id);
		comments = commentService.getCommentByWeibo(weibo);
		c = "{test:1}";
		request.setAttribute("c", c);
		return SUCCESS;
	}
}
