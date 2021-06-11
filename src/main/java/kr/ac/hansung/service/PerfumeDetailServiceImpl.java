package kr.ac.hansung.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dao.PerfumeDetailDao;
import kr.ac.hansung.entity.PerfumeDetail;

@Service
@Transactional
public class PerfumeDetailServiceImpl implements PerfumeDetailService {
	@Autowired
    private PerfumeDetailDao perfumeDetailRepository;
	
	@Override
	public PerfumeDetail getDetailById(Long perfumeId) {
		return perfumeDetailRepository.getDetailById(perfumeId);
	}
	
}