package org.up.comment.action;

import java.sql.Timestamp;
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
	private Comment comment;
	private Comment comment2;
	private Comment comment3;
	private List<Comment> comments;
	private Long weibo_id;
	
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
	
	public Comment getComment(){
		return comment;
	}
	
	public void setComent(Comment comment){
		this.comment = comment;
	}

	@Override
	public String execute() throws Exception {
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
		
		System.out.println("执行方法1");
		Weibo weibo = weiboService.loadWeiboById(weibo_id);
		System.out.println("执行方法2");
		comments = commentService.getCommentByWeibo(weibo);
		System.out.println("执行方法3");
		if(comments.get(0)!=null){
		comment = comments.get(0);
		}
		System.out.println("执行方法4");
		if(comments.size()>1){
		comment2 = comments.get(1);
		}
		if(comments.size()>2){
			comment3 = comments.get(2);
			}
		setComment(comment, comment2, comment3);
		System.out.println("执行方法6");
		return SUCCESS;
	}
	
	//下面是json的内容了
	//第1条评论
	private String nickname;
	private String content;
	private Timestamp time;
	private String avatar;
	public List<CommentLike> commentLikes;
	
	//第2条评论
	private String nickname2;
	private String content2;
	private Timestamp time2;
	private String avatar2;
	public List<CommentLike> commentLikes2;
	
	//第3条评论
	private String nickname3;
	private String content3;
	private Timestamp time3;
	private String avatar3;
	public List<CommentLike> commentLikes3;
	
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	public List<CommentLike> getCommentLikes() {
		return commentLikes;
	}

	public void setCommentLike(List<CommentLike> commentLikes) {
		this.commentLikes = commentLikes;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}
	
	//这是第2条评论的方法
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	
	public String getContent2() {
		return content2;
	}
	
	public String getAvatar2() {
		return avatar2;
	}

	public void setAvatar2(String avatar2) {
		this.avatar2 = avatar2;
	}
	
	public List<CommentLike> getCommentLikes2() {
		return commentLikes2;
	}

	public void setCommentLike2(List<CommentLike> commentLikes2) {
		this.commentLikes2 = commentLikes2;
	}
	
	public String getNickname2() {
		return nickname2;
	}

	public void setNickname2(String nickname2) {
		this.nickname2 = nickname2;
	}
	
	public Timestamp getTime2() {
		return time2;
	}

	public void setTime2(Timestamp time2) {
		this.time2 = time2;
	}
	
	
	//这是第3条评论的方法
		public void setContent3(String content3) {
			this.content3 = content3;
		}
		
		public String getContent3() {
			return content3;
		}
		
		public String getAvatar3() {
			return avatar3;
		}

		public void setAvatar3(String avatar3) {
			this.avatar3 = avatar3;
		}
		
		public List<CommentLike> getCommentLikes3() {
			return commentLikes3;
		}

		public void setCommentLike3(List<CommentLike> commentLikes3) {
			this.commentLikes3 = commentLikes3;
		}
		
		public String getNickname3() {
			return nickname3;
		}

		public void setNickname3(String nickname3) {
			this.nickname3 = nickname3;
		}
		
		public Timestamp getTime3() {
			return time3;
		}

		public void setTime3(Timestamp time3) {
			this.time3 = time3;
		}
	
	private void setComment(Comment comment, Comment comment2, Comment comment3){
		if(comment!=null){
		this.content = comment.getContent();
		this.nickname = comment.getUser().getNickname();
		this.time = comment.getTime();
		this.avatar = comment.getUser().getAvatar();
		this.commentLikes = comment.getCommentLikes();
		}
		
		//Comment2
		if(comment2!=null){
		this.content2 = comment2.getContent();
		this.nickname2 = comment2.getUser().getNickname();
		this.time2 = comment2.getTime();
		this.avatar2 = comment2.getUser().getAvatar();
		this.commentLikes2 = comment2.getCommentLikes();
		}
		//Comment3
		if(comment3!=null){
		this.content3 = comment3.getContent();
	    this.nickname3 = comment3.getUser().getNickname();
		this.time3 = comment3.getTime();
		this.avatar3 = comment3.getUser().getAvatar();
		this.commentLikes3 = comment2.getCommentLikes();
		}
		
	}
}
