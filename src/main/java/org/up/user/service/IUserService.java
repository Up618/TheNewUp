package org.up.user.service;

import java.util.List;

import org.up.model.User;


public interface IUserService {
	public User loadUserByUsername(String username);
	public User loadUserByNickname(String nickname);
	public User loadUserById(Long id);
	public List<User> searchUserByNickname(String nickname);
	public Long addUser(User user);
	public void editUser(User user);
}
