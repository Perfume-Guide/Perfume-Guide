package kr.ac.hansung.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.entity.PerfumeDetail;

@Repository
public class PerfumeDetailDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public PerfumeDetail getDetailById(Long perfumeId) {
		Session session = sessionFactory.getCurrentSession();
		PerfumeDetail detail = (PerfumeDetail) session.get(PerfumeDetail.class, perfumeId);
		
		return detail;
	}

}
