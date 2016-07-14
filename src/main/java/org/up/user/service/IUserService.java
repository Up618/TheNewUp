package org.up.user.service;

import java.util.List;

import org.up.model.User;
import org.up.model.Weibo;


public interface IUserService {
	public User loadUserByUsername(String username);
	public User loadUserByNickname(String nickname);
	public User loadUserById(Long id);
	public List<User> searchUserByNickname(String nickname);
	public List<User> listAllUsers();
	public Long addUser(User user);
	public void editUser(User user);
	public Boolean ifNicknameValid(String nickname);
	public Boolean ifUsernameValid(String username);
	public Boolean ifPhoneNumberValid(String phoneNumber);
	public Boolean ifEmailValid(String email);
	public void deleteUser(User user);
	public void deleteUserById(Long id);
}
