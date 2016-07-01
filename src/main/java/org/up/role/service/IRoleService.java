package org.up.role.service;

import org.up.model.Role;

public interface IRoleService {
	public Role loadRoleById(Long id);
	public Role loadRoleByName(String name);
}
