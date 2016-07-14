package org.up.follow.service;

import org.up.model.Follow;
import org.up.model.User;

import java.util.List;
public interface IFollowService {
	public void addFollow(Follow follow);
	public void deleteFollow(Follow follow);
	public Follow getFollow(String username, String followusername);
	public List<List> getFollowById(Long id,String username);
	public List<List> getFansById(Long id,String username);
	public List<List> getFollowById(Long id, String username, Integer page, Integer rows);
	public List<List> getFansById(Long id, String username, Integer page, Integer rows);
}
