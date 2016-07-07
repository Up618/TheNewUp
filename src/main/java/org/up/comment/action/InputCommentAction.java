package org.up.comment.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
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

@Actions({ @Action(value = "inputComment")})
@Results({@Result(name="success",type="redirectAction",params={"namespace","/user","actionName","1"})})
public class InputCommentAction extends ActionSupport {
	/**
	 * @author yuhui
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String content;
	private Weibo weibo;
	private Comment comment;
	private List<Comment> comments;
	private Long weibo_id;
	
	@Autowired
	private ICommentService commentService;
	
	@Autowired
	private IWeiboService weiboService;
	
	@Autowired
	private IUserService userService;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
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
	
	public Comment getComment(){
		return comment;
	}
	
	public void setComment(Comment comment){
		this.comment = comment;
	}
	
	public List<Comment> getComments(){
		return comments;
	}
	
	public void setComments(List<Comment> comments){
		this.comments = comments;
	}

	@Override
	public String execute() throws Exception {
		comment = new Comment();
    	System.out.println("weibo_id: "+weibo_id);
    	
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

		Weibo weibo = weiboService.loadWeiboById(weibo_id);
		if(content!=null){
			System.out.println("填写评论！！");
		    comment.setUser(user);
		    comment.setContent(content);
		    comment.setWeibo(weibo);
		    commentService.addComment(comment);
		}
		comments = commentService.getCommentByWeibo(weibo);
		System.out.println("comments"+comments);
		return SUCCESS;
	}
}
