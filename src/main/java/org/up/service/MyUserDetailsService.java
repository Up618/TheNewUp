package org.up.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;
import org.up.model.User;

@Service
public class MyUserDetailsService implements UserDetailsService {

	@Autowired
	private IBaseDao<User> userDao;

	@Transactional
	@Override
	public UserDetails loadUserByUsername(String arg0) throws UsernameNotFoundException {
		List<Object> param = new ArrayList<Object>();
		param.add(arg0);
		User user = userDao.get("from User where username=?", param);
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(user.getRole().getName()));
		if(user.getRole().getName()=="ROLE_ADMIN"||user.getRole().getName().equals("ROLE_ADMIN"))authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPasswordHash(),
				authorities);
	}
}
