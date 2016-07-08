package org.up.comment.service;

import java.util.List;

import org.up.model.Comment;
import org.up.model.Weibo;
import org.up.model.User;

public interface ICommentService {
	public Comment loadCommentById(Long id);
	
	public List<Comment> getCommentBycurrentUsername(String username);
	public List<Comment> getCommentBycurrentNickname(String nickname);
	public List<Comment> getCommentBycurrentUserId(Long userId);
	public List<Comment> getCommentBycurrentUser(User user);
	
	public Long addComment(Comment comment);
	public Long countCommentLike(Comment comment);
	public Long countCommentBycurrentUsername(String username);
	public Long countCommentBycurrentUser(User user);
	public Long countCommentBycurrentUserId(Long userId);
	public Long countCommentBycurrentNickname(String nickname);
	public void deleteComment(Comment comment);
	public void deleteCommentById(Long id);
	
	public List<Comment> getCommentByWeibo(Weibo weibo);
	public List<Comment> getCommentByWeiboId(Long weiboId);
	public Long countCommentByWeiboId(Long weiboId);
	public Long countCommentByWeibo(Weibo weibo);
}
