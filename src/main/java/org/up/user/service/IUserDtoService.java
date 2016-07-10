package org.up.user.service;

import java.util.List;

import org.up.dto.UserDto;

public interface IUserDtoService {
	public UserDto loadUserDtoByUsername(String username);
	public UserDto loadUserDtoById(Long id);
	public UserDto loadUserDtoByNickname(String nickname);
	public UserDto loadUserDtoByUsername(String username, Long myId);
	public UserDto loadUserDtoById(Long id, Long myId);
	public UserDto loadUserDtoByNickname(String nickname, Long myId);
	public UserDto loadUserDtoByUsername(String username, String myUsername);
	public UserDto loadUserDtoById(Long id, String myUsername);
	public UserDto loadUserDtoByNickname(String nickname, String myUsername);
	public List<UserDto> searchUserDtoByNickname(String nickname, Long myId);
	public List<UserDto> searchUserDtoByNickname(String keyword, String username);
}
