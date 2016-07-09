package org.up.dto.service;

import java.util.List;
import org.up.dto.UserDto;

public interface IUserDtoService {
	public List<UserDto> getUserDtoByUsername(String username);
	public List<List> getUserByUsername(String username);
	public List<List> getFansByUsername(String username);
}
