package com.linestore.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.linestore.dao.NoticeDao;
import com.linestore.util.Page;
import com.linestore.vo.Notice;

public class NoticeDaoImpl extends HibernateDaoSupport implements NoticeDao {

	@Override
	public List<Notice> selectAll(Page page) {
		// TODO Auto-generated method stub
		Session session = this.getSessionFactory().getCurrentSession();
		Query query = session.createQuery("from Notice order by time desc");
		query.setMaxResults(page.getEveryPage());
		query.setFirstResult(page.getBeginIndex());

		return query.list();
	}

	@Override
	public void addNotice(Notice notice) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(notice);

	}

	@Override
	public List<Notice> selectNew() {
		// TODO Auto-generated method stub
		String hql = "from Notice order by time desc limit 5";
		List<Notice> list = (List<Notice>) this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		String hql = "from Notice where id = ?";

		List<Notice> list = (List<Notice>) this.getHibernateTemplate().find(hql, id);
		this.getHibernateTemplate().delete(list.get(0));

	}

}
