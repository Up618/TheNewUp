package org.up.commentlike.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.annotations.Formula;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import com.opensymphony.xwork2.ActionSupport;

import org.up.model.CommentLike;
import org.up.model.Comment;
import org.up.model.User;
import org.up.commentlike.service.ICommentLikeService;
import org.up.user.service.IUserService;
import org.up.comment.service.ICommentService;

//@Results({ @Result(name = "success", type = "redirectAction", params={"namespace","/user","actionName","1"})})
//1处应该是user_id，暂且用1代替
@Results({ @Result(name = "success", type = "json") })
//返回一个json对象给前端，可以调取其中的属性参数

@Action("comment-like")
@SuppressWarnings("serial")
public class CommentLikeAction extends ActionSupport {

	/**
	 * 评论的点赞操作，高度复用AgreeAction
	 */

	private Long comment_id; // 接收前段传来的comment_id
	private boolean ifLiked; // 创建一个变量判断是否被点赞过，供前端调取

	public Long getComment_id() {
		return comment_id;
	}

	public void setComment_id(Long comment_id) {
		this.comment_id = comment_id;
	}
	
	public boolean isIfLiked() {
		return ifLiked;
	}

	public void setIfLiked(boolean ifLiked) {
		this.ifLiked = ifLiked;
	}

	/**
	 * 获取Service对象
	 */
	@Autowired
	private ICommentLikeService commentLikeService;
	@Autowired
	private IUserService userService;
	@Autowired
	private ICommentService commentService;

	@Override
	public String execute() throws Exception {

		CommentLike commentlike = new CommentLike();
		String currentUsername;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			currentUsername = ((UserDetails) principal).getUsername();
		} else {
			currentUsername = principal.toString();
		}

		comment_id = getComment_id();
		// commentLikeAmount = commentLikeService.countcommentLikeAmountByCommentId(comment_id);
		System.out.println(currentUsername);// 调试语句
		System.out.println(comment_id);
		// System.out.println(commentLikeAmount);
		commentlike = commentLikeService.loadCommentLikeByCommentAndUser(comment_id, currentUsername);// 获取对应微博id、用户id的赞

		if (commentlike != null)
			ifLiked = true; // 获得了commentlike实体，已经被点赞过
		else
			ifLiked = false;

		if (ifLiked) {
			commentLikeService.cancelCommentLike(commentlike); // 被点赞过，取消点赞
		} else {
			CommentLike commentlike2 = new CommentLike();
			Comment comment = commentService.loadCommentById(comment_id);
			User user = userService.loadUserByUsername(currentUsername);
			commentlike2.setUser(user);
			commentlike2.setComment(comment);
			commentLikeService.addCommentLike(commentlike2); // 新增点赞
		}
		return SUCCESS;
	}
}
