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
	private IBaseDao<CommentLike> commentLikeDao;

	public Long addCommentLike(CommentLike commentLike) {
		return (Long) commentLikeDao.save(commentLike);
	}

	public boolean cancelCommentLike(CommentLike commentLike) {
		try {
			commentLikeDao.delete(commentLike);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean cancelCommentLikeById(Long id) {
		try {
			commentLikeDao.delete(commentLikeDao.get(CommentLike.class, id));
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public CommentLike loadCommentLikeById(Long id) {
		return commentLikeDao.get(CommentLike.class, id);
	}

	public List<CommentLike> listCommentLikeByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return commentLikeDao.find("select cl from commentlike cl where a.user.username = ?", params);
	}

	@Override
	public List<CommentLike> listCommentLikeByCommentId(String commentId) {
		List<Object> params = new ArrayList<Object>();
		params.add(commentId);
		return commentLikeDao.find("select cl from commentlike cl where a.comment.id = ?", params);
	}

	@Override
	public Long countCommentLikeAmountByCommentId(Long commentId) {
		List<Object> params = new ArrayList<Object>();
		params.add(commentId);
		return commentLikeDao.count("select count(a) from commentlike cl where a.comment.id = ?", params);
	}

	/**
	 * 加载对应评论中对应用户的赞。
	 */
	@Override
	public CommentLike loadCommentLikeByCommentAndUser(Long commentId, String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(commentId);
		params.add(username);
		// boolean isEmpty = commentLikeDao.find("select cl from commentlike cl "
		// + "where a.comment.id = ? and a.user.username = ?", params).isEmpty();
		CommentLike commentLike = new CommentLike();
		commentLike = commentLikeDao.get("select cl from commentlike cl where a.comment.id = ? and a.user.username = ?", params);
		return commentLike;
	}

}
