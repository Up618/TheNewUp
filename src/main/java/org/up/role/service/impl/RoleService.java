package org.up.role.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.Role;
import org.up.role.service.IRoleService;

@Service
@Transactional
public class RoleService implements IRoleService {
	@Autowired
	private IBaseDao<Role> roleDao;

	@Override
	public Role loadRoleById(Long id) {
		return roleDao.get(Role.class, id);
	}

	@Override
	public Role loadRoleByName(String name) {
		List<Object> params = new ArrayList<Object>();
		params.add(name);
		return roleDao.get("from Role where name = ?", params);
	}

}
