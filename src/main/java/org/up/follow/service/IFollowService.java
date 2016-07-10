package org.up.follow.service;

import org.up.model.Follow;
import org.up.model.User;

import java.util.List;
public interface IFollowService {
	public void addFollow(Follow follow);
	public void deleteFollow(Follow follow);
	public List<Follow> findByUsername(String username);
	public List<Follow> findByFollowUsername(String username);
	public long findFollowNumByUsername(String username);
	public long findFansNumByUsername(String username);
	public boolean findIfFollowByUsername(String username, String followusername);
	public Follow getFollow(String username, String followusername);
	public List<User> findFollowUserByUserName(String username);
	public List<User> findFansByUsername(String username);
	public List<List> getFollowByUsername(String username);
	public List<List> getFansByUsername(String username);
	public List<List> getFollowById(Long id,String username);
	public List<List> getFansById(Long id,String username);
}
