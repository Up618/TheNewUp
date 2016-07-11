package org.up.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.dto.UserDto;
import org.up.user.service.IUserDtoService;

@Service
@Transactional
public class UserDtoService implements IUserDtoService {
	@Autowired
	IBaseDao<UserDto> userDtoDao;

	@Override
	public UserDto loadUserDtoByUsername(String username) {
		List<Object> param = new ArrayList<Object>();
		param.add(username);
		return userDtoDao.get("select new org.up.dto.UserDto(u) from User u where u.username = ?", param);
	}

	@Override
	public UserDto loadUserDtoById(Long id) {
		List<Object> param = new ArrayList<Object>();
		param.add(id);
		return userDtoDao.get("select new org.up.dto.UserDto(u) from User u where u.id = ?", param);
	}

	@Override
	public UserDto loadUserDtoByNickname(String nickname) {
		List<Object> param = new ArrayList<Object>();
		param.add(nickname);
		return userDtoDao.get("select new org.up.dto.UserDto(u) from User u where u.nickname = ?", param);
	}

	@Override
	public List<UserDto> searchUserDtoByNickname(String nickname, Long myId) {
		List<Object> param = new ArrayList<Object>();
		param.add(myId);
		param.add(myId);
		param.add(myId);
		param.add(nickname);
		return userDtoDao.find("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.id from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.id from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end,"
				+ "case when "
				+ "? = u.id then 'true' else 'false' end) "
				+ "from User u where u.nickname like ?", param);
	}

	@Override
	public List<UserDto> searchUserDtoByNickname(String keyword, String username) {
		List<Object> param = new ArrayList<Object>();
		param.add(username);
		param.add(username);
		param.add(username);
		param.add("%"+keyword+"%");
		return userDtoDao.find("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.username from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.username from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.username then 'true' else 'false' end) "
				+ "from User u where u.nickname like ?", param);
	}

	@Override
	public UserDto loadUserDtoByUsername(String username, Long myId) {
		List<Object> param = new ArrayList<Object>();
		param.add(myId);
		param.add(myId);
		param.add(myId);
		param.add(username);
		return userDtoDao.get("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.id from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.id from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.id then 'true' else 'false' end) "
				+ "from User u where u.username = ?", param);
	}

	@Override
	public UserDto loadUserDtoById(Long id, Long myId) {
		List<Object> param = new ArrayList<Object>();
		param.add(myId);
		param.add(myId);
		param.add(myId);
		param.add(id);
		return userDtoDao.get("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.id from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.id from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.id then 'true' else 'false' end) "
				+ "from User u where u.id = ?", param);
	}

	@Override
	public UserDto loadUserDtoByNickname(String nickname, Long myId) {
		List<Object> param = new ArrayList<Object>();
		param.add(myId);
		param.add(myId);
		param.add(myId);
		param.add(nickname);
		return userDtoDao.get("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.id from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.id from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.id then 'true' else 'false' end) "
				+ "from User u where u.nickname = ?", param);
	}

	@Override
	public UserDto loadUserDtoByUsername(String username, String myUsername) {
		List<Object> param = new ArrayList<Object>();
		param.add(myUsername);
		param.add(myUsername);
		param.add(myUsername);
		param.add(username);
		return userDtoDao.get("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.username from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.username from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.username then 'true' else 'false' end) "
				+ "from User u where u.username = ?", param);
	}

	@Override
	public UserDto loadUserDtoById(Long id, String myUsername) {
		List<Object> param = new ArrayList<Object>();
		param.add(myUsername);
		param.add(myUsername);
		param.add(myUsername);
		param.add(id);
		return userDtoDao.get("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.username from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.username from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.username then 'true' else 'false' end) "
				+ "from User u where u.id = ?", param);
	}

	@Override
	public UserDto loadUserDtoByNickname(String nickname, String myUsername) {
		List<Object> param = new ArrayList<Object>();
		param.add(myUsername);
		param.add(myUsername);
		param.add(myUsername);
		param.add(nickname);
		return userDtoDao.get("select new org.up.dto.UserDto(u, "
				+ "case when "
				+ "? in (select f.following.username from Follow f where f.followed.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? in (select f.followed.username from Follow f where f.following.id = u.id) "
				+ "then 'true' else 'false' end, "
				+ "case when "
				+ "? = u.username then 'true' else 'false' end) "
				+ "from User u where u.nickname = ?", param);
	}

}
