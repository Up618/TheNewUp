package org.up.follow.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.up.follow.service.IFollowService;
import org.up.model.Follow;
import org.up.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;


@Service("followService")
@Transactional
public class FollowService implements IFollowService{


	@Autowired	
	private IBaseDao<List> listDao;
	@Autowired
	private IBaseDao<User> userDao;
	@Autowired
	private IBaseDao<Follow> followDao;
	@Override
	public void addFollow(Follow follow) {
		// TODO Auto-generated method stub
		followDao.save(follow);
	}

	@Override
	public void deleteFollow(Follow follow) {
		// TODO Auto-generated method stub
		followDao.delete(follow);
	}

	@Override
	public List<Follow> findByUsername(String username) {
		// TODO Auto-generated method stub

		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return followDao.find("select p from Follow p where p.following.username = ?",params);
	}

	@Override
	public List<Follow> findByFollowUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return followDao.find("select p from Follow p where p.followed.username = ?",params);

	}

	@Override
	public long findFollowNumByUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return followDao.count("select count(*) p from Follow p where p.followed.username = ?",params);
	}

	@Override
	public long findFansNumByUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return followDao.count("select count(*) p from Follow p where p.followed.username=?", params);
	}

	@Override
	public boolean findIfFollowByUsername(String username, String followusername) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(followusername);
		followDao.get("select p from Follow p where p.following.username = ? and p.followed.username = ?", params);
		return false;
	}

	@Override
	public Follow getFollow(String username, String followusername) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(followusername);
		return followDao.get("select p from Follow p where p.following.username = ? and p.followed.username = ?", params);
	}

	@Override
	public List<User> findFollowUserByUserName(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return userDao.find("select p.followed from Follow p where p.following.username = ?",params);

	}

	@Override
	public List<User> findFansByUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		return userDao.find("select p.following from Follow p where p.followed.username = ?",params);

	}

	@Override
	public List<List> getFollowByUsername(String username) {
		// TODO Auto-generated method stub
		List<Object> params = new ArrayList<Object>();
		params.add(username);
		params.add(username);
		return listDao.find("select new list(f.followed,"
				+ "case when ? in (select c.followed.username from Follow c where c.following.username = f.followed.username) then 'true' else 'false' end)"
				
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
