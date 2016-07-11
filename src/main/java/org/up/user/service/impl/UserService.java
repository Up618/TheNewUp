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

	@Override
	public User loadUserById(Long id) {
		return userDao.get(User.class, id);
	}

	@Override
	public List<User> searchUserByNickname(String nickname) {
		return userDao.find("from User where nickname like \'%" + nickname + "%\'");
	}

	@Override
	public Boolean ifNicknameValid(String nickname) {
		List<Object> param = new ArrayList<Object>();
		param.add(nickname);
		return userDao.count("select count(u) from User u where nickname = ?", param) == 0;
	}

	@Override
	public Boolean ifUsernameValid(String username) {
		List<Object> param = new ArrayList<Object>();
		param.add(username);
		return userDao.count("select count(u) from User u where username = ?", param) == 0;
	}

}
