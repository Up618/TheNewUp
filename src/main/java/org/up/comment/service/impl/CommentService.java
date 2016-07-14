package org.up.comment.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.comment.service.ICommentService;
import org.up.dao.IBaseDao;
import org.up.model.Comment;
import org.up.model.User;
import org.up.model.Weibo;

@Service
@Transactional
public class CommentService implements ICommentService {
	@Autowired
	private IBaseDao<Comment> commentDao;

	@Override
	public List<Comment> getCommentBycurrentUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return commentDao.find("select w from Weibo w where w.user.username = ?",params);
	}

	@Override
	public Comment loadCommentById(Long id) {
		return commentDao.get(Comment.class, id);
	}
	
	@Override
	public Long countCommentLike(Comment comment){
		return 1L;
	}

	@Override
	public Long addComment(Comment comment) {
		return (Long) commentDao.save(comment);
	}

	@Override
	public void deleteComment(Comment comment) {
		commentDao.delete(comment);
	}

	@Override
	public void deleteCommentById(Long id) {
		commentDao.delete(commentDao.get(Comment.class, id));
	}

	@Override
	public List<Comment> getCommentBycurrentNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		return commentDao.find("select c from Comment c where c.user.nickname = ? order by c.time desc",params);
	}

	@Override
	public List<Comment> getCommentBycurrentUserId(Long userId) {
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		return commentDao.find("select c from Comment c where c.user.id = ? order by c.time desc",params);
	}

	@Override
	public List<Comment> getCommentBycurrentUser(User user) {
		List<Object> params = new ArrayList<Object>();
		params.add(user);
		return commentDao.find("select c from Comment c where c.user = ? order by c.time desc", params);
	}
	
	@Override
	public List<Comment> getCommentByWeibo(Weibo weibo) {
		List<Object> params = new ArrayList<Object>();
		params.add(weibo);
		return commentDao.find("select c from Comment c where c.weibo = ? order by c.time desc", params);
	}
	
	@Override
	public List<Comment> getCommentByWeiboId(Long weiboId){
		List<Object> params = new ArrayList<Object>();
		params.add(weiboId);
		return commentDao.find("select c from Comment c where c.weibo.id = ? order by c.time desc", params);
	}

	@Override
	public Long countCommentByWeiboId(Long weiboId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public Long countCommentBycurrentUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return commentDao.count("select count(c) from Comment c where c.user.username = ?", params);
	}

	
	@Override
	public Long countCommentBycurrentUser(User user) {
		List<Object> params = new ArrayList<Object>();
		params.add(user);
		return commentDao.count("select count(c) from Comment c where c.user = ?", params);
	}
	

	
	@Override
	public Long countCommentBycurrentUserId(Long userId) {
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		return commentDao.count("select count(c) from Comment c where c.user.id = ?", params);
	}
	

	
	@Override
	public Long countCommentBycurrentNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		return commentDao.count("select count(w) from Weibo w where w.user.nickname = ?", params);
	}
	
	@Override
	public Long countCommentByWeibo(Weibo weibo){
		List<Object> params = new ArrayList<Object>();
		params.add(weibo);
		return commentDao.count("select count(c) from Comment c where c.weibo = ?", params);
	}
	
}
