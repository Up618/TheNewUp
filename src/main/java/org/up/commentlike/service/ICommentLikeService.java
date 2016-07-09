package org.up.commentlike.service;

import java.util.List;
import org.up.model.CommentLike;

public interface ICommentLikeService {

	public Long addCommentLike(CommentLike commentLike); // 点赞
	public boolean cancelCommentLike(CommentLike commentLike); // 取消点赞
	public boolean cancelCommentLikeById(Long Id);

	public CommentLike loadCommentLikeById(Long id);
	public CommentLike loadCommentLikeByCommentAndUser(Long commentId, String username);
	public List<CommentLike> listCommentLikeByUsername(String username);
	public List<CommentLike> listCommentLikeByCommentId(String commentId);

	public Long countCommentLikeAmountByCommentId(Long commentId); // 某条评论的点赞数

}
