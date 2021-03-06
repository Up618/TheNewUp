package org.up.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.User;
import org.up.model.Weibo;
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
		return userDao.get("select u from User u where username = ?", params);
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
		return userDao.get("select u from User u where nickname = ?", params);
	}

	@Override
	public User loadUserById(Long id) {
		return userDao.get(User.class, id);
	}

	@Override
	public List<User> searchUserByNickname(String nickname) {
		return userDao.find("select u from User u where nickname like \'%" + nickname + "%\'");
	}
	
	@Override
	public List<User> listAllUsers() { //列出所有非管理员的用户
		return userDao.find("select u from User u where role_id <> 2");
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

	@Override
	public Boolean ifPhoneNumberValid(String phoneNumber) {
		List<Object> param = new ArrayList<Object>();
		param.add(phoneNumber);
		return userDao.count("select count(u) from User u where phoneNumber = ?", param) == 0;
	}

	@Override
	public Boolean ifEmailValid(String email) {
		List<Object> param = new ArrayList<Object>();
		param.add(email);
		return userDao.count("select count(u) from User u where email = ?", param) == 0;
	}

	@Override
	public void deleteUser(User user) {
		userDao.delete(user);
	}

	@Override
	public void deleteUserById(Long id) {
		userDao.delete(userDao.get(User.class, id));
	}

	@Override
	public void banUserByUsername(String username) {
		List<Object> param = new ArrayList<Object>();
		param.add(username);
		System.out.println("added");
		userDao.executeHql("update User set role_id = 3 where username = ?", param);
	}
	
	@Override
	public void unbanUserByUsername(String username) {
		List<Object> param = new ArrayList<Object>();
		param.add(username);
		userDao.executeHql("update User set role_id = 1 where username = ?", param);
	}

	@Override
	public void banUserById(Long id) {
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		userDao.executeHql("update User set role_id = 3 where id = ?", param);
	}

	@Override
	public void unbanUserById(Long id) {
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		userDao.executeHql("update User set role_id = 1 where id = ?", param);
		
	}
}
