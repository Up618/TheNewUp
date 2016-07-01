package org.up.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.up.dao.IBaseDao;

@Repository("baseDao")
@Transactional
public class BaseDao<T> implements IBaseDao<T> {
	@Autowired
	private SessionFactory sessionFactory;

	public Serializable save(T o) {
		return sessionFactory.getCurrentSession().save(o);
	}

	public void delete(T o) {
		sessionFactory.getCurrentSession().delete(o);
	}

	public void update(T o) {
		sessionFactory.getCurrentSession().update(o);
	}

	public void saveOrUpdate(T o) {
		sessionFactory.getCurrentSession().saveOrUpdate(o);
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql, Object[] param) {
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql, List<Object> param) {
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).getResultList();
	}

	public T get(Class<T> c, Serializable id) {
		return sessionFactory.getCurrentSession().get(c, id);
	}

	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public Long count(String hql) {
		return (Long) sessionFactory.getCurrentSession().createQuery(hql).getSingleResult();
	}

	public Long count(String hql, Object[] param) {
		@SuppressWarnings("unchecked")
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.getSingleResult();
	}

	public Long count(String hql, List<Object> param) {
		@SuppressWarnings("unchecked")
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (Long) q.getSingleResult();
	}

	public Integer executeHql(String hql) {
		return sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}

	public Integer executeHql(String hql, Object[] param) {
		@SuppressWarnings("unchecked")
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		@SuppressWarnings("unchecked")
		Query<T> q = sessionFactory.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}
}
