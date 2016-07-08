package org.up.commentlike.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.up.commentlike.service.ICommentLikeService;
import org.up.dao.IBaseDao;
import org.up.model.CommentLike;
import java.util.ArrayList;
import java.util.List;

/**
 * 评论点赞的Service，高度复用AgreeService
 */

@Service("commentLikeService")
public class CommentLikeService implements ICommentLikeService {

	@Autowired
	private IBaseDao<CommentLike> commentlikeDao;

	public Long addCommentLike(CommentLike commentlike) {
		return (Long) commentlikeDao.save(commentlike);
	}

	public boolean cancelCommentLike(CommentLike commentlike) {
		try {
			commentlikeDao.delete(commentlike);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean cancelCommentLikeById(Long id) {
		try {
			commentlikeDao.delete(commentlikeDao.get(CommentLike.class, id));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public CommentLike loadCommentLikeById(Long id) {
		return commentlikeDao.get(CommentLike.class, id);
	}

	public List<CommentLike> listCommentLikeByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return commentlikeDao.find("select cl from CommentLike cl where a.user.username = ?", params);
	}

	@Override
	public List<CommentLike> listCommentLikeByCommentId(String commentId) {
		List<Object> params = new ArrayList<Object>();
		params.add(commentId);
		return commentlikeDao.find("select cl from CommentLike cl where a.comment.id = ?", params);
	}

	@Override
	public Long countCommentLikeAmountByCommentId(Long commentId) {
		List<Object> params = new ArrayList<Object>();
		params.add(commentId);
		return commentlikeDao.count("select count(a) from CommentLike cl where a.comment.id = ?", params);
	}

	/**
	 * 加载对应评论中对应用户的赞。
	 */
	@Override
	public CommentLike loadCommentLikeByCommentAndUser(Long commentId, String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(commentId);
		params.add(username);
		// boolean isEmpty = commentlikeDao.find("select cl from CommentLike cl "
		// + "where a.comment.id = ? and a.user.username = ?", params).isEmpty();
		CommentLike commentlike = new CommentLike();
		commentlike = commentlikeDao.get("select cl from CommentLike cl " + "where a.comment.id = ? and a.user.username = ?", params);
		return commentlike;
	}

}
