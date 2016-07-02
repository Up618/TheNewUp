package org.up.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.User;
import org.up.user.service.IUserService;


@Service
@Transactional
public class UserService implements IUserService {
	@Autowired
	private IBaseDao<User> userDao;

	@Override
	public User loadUserByUsername(String username) {
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return userDao.get("from User where username = ?", params);
	}

	@Override
	public Long addUser(User user) {
		return (Long) userDao.save(user);
	}

	@Override
	public void editUser(User user) {
		userDao.update(user);
	}

	@Override
	public User loadUserByNickname(String nickname) {
		List<Object> params = new ArrayList<Object>();
		params.add(nickname);
		return userDao.get("from User where nickname = ?", params);
	}

}
