package org.up.weibo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.dto.WeiboDto;
import org.up.model.User;
import org.up.weibo.service.IWeiboDtoService;

@Service
@Transactional
public class WeiboDtoService implements IWeiboDtoService {
	
	@Autowired
	IBaseDao<WeiboDto> weiboDtoDao;

	@Override
	public List<WeiboDto> getWeiboDtoByUsername(String username, Integer page, Integer rows) {
		List<Object> param = new ArrayList<Object>();
		param.add(username);
		param.add(username);
		return weiboDtoDao.find("select new org.up.dto.WeiboDto(w, case when ? in (select a.user.username from w.agrees a) then 'true' else 'false' end) from Weibo w where w.user.username = ? order by w.time desc", param, page, rows);
	}

	@Override
	public List<WeiboDto> getWeiboDtoByNickname(String nickname, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUserId(Long userId, Integer page, Integer rows) {
		List<Object> param = new ArrayList<Object>();
		param.add(userId);
		param.add(userId);
		return weiboDtoDao.find("select new org.up.dto.WeiboDto(w, case when ? in (select a.user.id from w.agrees a) then 'true' else 'false' end) from Weibo w where w.user.id = ? order by w.time desc", param, page, rows);
	}

	@Override
	public List<WeiboDto> getWeiboDtoByCurrentUsername(String username, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByCurrentNickname(String nickname, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByCurrentUserId(Long userId, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUser(User user, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUserLiked(Long userId, Integer page, Integer rows) {
		List<Object> param = new ArrayList<Object>();
		param.add(userId);
		return weiboDtoDao.find("select new org.up.dto.WeiboDto(w, true) from Weibo w join w.agrees as a where a.user.id = ?", param, page, rows);
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUsername(String username, String myUsername, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByNickname(String nickname, String myUsername, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUserId(Long userId, String myUsername, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUser(User user, String myUsername, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WeiboDto> getWeiboDtoByUserLiked(Long userId, String myUsername, Integer page, Integer rows) {
		// TODO Auto-generated method stub
		return null;
	}

}
