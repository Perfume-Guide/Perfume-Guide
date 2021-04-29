package kr.ac.hansung.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.entity.Perfume;

@Repository
public class PerfumeDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Perfume getPerfumeByName(String name) {
		Session session = sessionFactory.getCurrentSession();
		Perfume perfume = (Perfume) session.get(Perfume.class, name);
		
		return perfume;
	}

	public List<Perfume> getPerfumes() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Perfume";

		Query<Perfume> query = session.createQuery(hql, Perfume.class);
		List<Perfume> perfumes = query.getResultList();

		return perfumes;
	}

	public String addPerfume(Perfume perfume) {
		Session session = sessionFactory.getCurrentSession();
		String name = (String) session.save(perfume);
		session.flush();
		return name;
	}

	public void deletePerfume(Perfume perfume) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(perfume);
		session.flush();
	}

	public void updatePerfume(Perfume perfume) {
		Session session = sessionFactory.getCurrentSession();
		session.update(perfume);
		session.flush();
	}
}
