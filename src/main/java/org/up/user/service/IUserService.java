package org.up.user.service;

import org.up.model.User;


public interface IUserService {
	public User loadUserByUsername(String username);
	public User loadUserByNickname(String nickname);
	public User loadUserById(Long id);
	public Long addUser(User user);
	public void editUser(User user);
}
