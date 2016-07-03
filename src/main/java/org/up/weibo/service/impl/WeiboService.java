package org.up.weibo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.User;
import org.up.model.Weibo;
import org.up.weibo.service.IWeiboService;

@Service
@Transactional
public class WeiboService implements IWeiboService {
	@Autowired
	private IBaseDao<Weibo> weiboDao;

	@Override
	public List<Weibo> getWeiboByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return weiboDao.find("select w from Weibo w where w.user.username = ?",params);
	}

	@Override
	public Weibo loadWeiboById(Long id) {
		return weiboDao.get(Weibo.class, id);
	}

	@Override
	public List<Weibo> getWeiboByCurrentUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(username);
		return weiboDao.find("select w from Weibo w "
				+ "join w.user.followed f"
				+ "where f.following.username = ? and where w.user.username = ?",params);
	}

	@Override
	public Long addWeibo(Weibo weibo) {
		return (Long) weiboDao.save(weibo);
	}

	@Override
	public void deleteWeibo(Weibo weibo) {
		weiboDao.delete(weibo);
	}

	@Override
	public void deleteWeiboById(Long id) {
		weiboDao.delete(weiboDao.get(Weibo.class, id));
	}

	@Override
	public List<Weibo> getWeiboByNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		return weiboDao.find("select w from Weibo w where w.user.nickname = ?",params);
	}

	@Override
	public List<Weibo> getWeiboByUserId(Long userId) {
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		return weiboDao.find("select w from Weibo w where w.user.id = ?",params);
	}

	@Override
	public List<Weibo> getWeiboByCurrentNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		params.add(nickname);
		return weiboDao.find("select w from Weibo w "
				+ "join w.user.followed f"
				+ "where f.following.nickname = ? and where w.user.nickname = ?",params);
	}

	@Override
	public List<Weibo> getWeiboByCurrentUserId(Long userId) {
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		params.add(userId);
		return weiboDao.find("select w from Weibo w "
				+ "join w.user.followed f"
				+ "where f.following.id = ? and where w.user.id = ?",params);
	}

	@Override
	public List<Weibo> getWeiboByUser(User user) {
		List<Object> params = new ArrayList<Object>();
		params.add(user);
		return weiboDao.find("select w from Weibo w where w.user = ?", params);
	}

	@Override
	public Long countWeiboByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return weiboDao.count("select count(w) from Weibo w where w.user.username = ?", params);
	}

	@Override
	public Long countWeiboByUser(User user) {
		List<Object> params = new ArrayList<Object>();
		params.add(user);
		return weiboDao.count("select count(w) from Weibo w where w.user = ?", params);
	}

	@Override
	public Long countWeiboByUserId(Long userId) {
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		return weiboDao.count("select count(w) from Weibo w where w.user.id = ?", params);
	}

	@Override
	public Long countWeiboByNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		return weiboDao.count("select count(w) from Weibo w where w.user.nickname = ?", params);
	}
	
}
