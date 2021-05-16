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

	public Perfume getPerfumeById(Long id) {
		Session session = sessionFactory.getCurrentSession();
		Perfume perfume = (Perfume) session.get(Perfume.class, id);
		
		return perfume;
	}

	public List<Perfume> getPerfumes() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Perfume";

		Query<Perfume> query = session.createQuery(hql, Perfume.class);
		List<Perfume> perfumes = query.getResultList();

		return perfumes;
	}

	
	public List<Perfume> getPerfumesByBrand(String brand){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Perfume where brand=:brand";
		
		Query<Perfume> query = session.createQuery(hql, Perfume.class);
		query.setParameter("brand",brand);
		
		List<Perfume> perfumes = query.getResultList();
		
		return perfumes;
		
	}
	
	public List<Perfume> getPerfumesByName(String name){
		Session session = sessionFactory.getCurrentSession();
		String hql = "from Perfume where name=:name";
		
		Query<Perfume> query = session.createQuery(hql, Perfume.class);
		query.setParameter("name",name);
		
		List<Perfume> perfumes = query.getResultList();
		
		return perfumes;
		
	}
	
	
	
	public Long addPerfume(Perfume perfume) {
		Session session = sessionFactory.getCurrentSession();
		Long id = (Long) session.save(perfume);
		session.flush();
		return id;
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
