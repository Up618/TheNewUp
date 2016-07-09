package org.up.dto.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.dto.service.IUserDtoService;
import org.up.model.Follow;
import org.up.model.User;
import org.up.dto.UserDto;
@Service("userDtoService")
@Transactional
public class UserDtoService implements IUserDtoService{


	@Autowired	
	private IBaseDao<List> listDao;
	@Autowired	
	private IBaseDao<UserDto> userDtoDao;
	@Autowired
	private IBaseDao<Follow> followDao;
	
	public List<UserDto> getUserDtoByUsername(String username){
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return userDtoDao.find("select new org.up.dto.UserDto("
				+ "f.following.username,"
				+ "f.following.nickname,"
				+ "f.following.getFollowAmount(),"
				+ "f.following.getFansAmount(),"
				+ "f.following.getWeiboAmount(),"
				+ "case when :username in (select c.followed.username from Follow c where c.following.username = f.followed.username) then 'true' else 'false' end)"
				+ " from Follow f where f.following.username = :username");
		
	}

	@Override
	public List<List> getUserByUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(username);
		return listDao.find("select new list(f.followed,"
				+ "case when ? in (select c.followed.username from Follow c where c.following.username = f.followed.username) then 'true' else 'true' end)"
				
				+ " from Follow f where f.following.username = ?", params);
	}

	@Override
	public List<List> getFansByUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(username);
		return listDao.find("select new list(f.following,"
				+ "case when ? in (select c.following.username from Follow c where c.followed.username = f.following.username) then 'true' else 'false' end)"
				+ " from Follow f where f.followed.username = ?", params);
	}
	
	
	
}
