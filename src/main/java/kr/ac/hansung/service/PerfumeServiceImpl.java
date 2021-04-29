package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dao.PerfumeDao;
import kr.ac.hansung.entity.Perfume;

@Service
@Transactional
public class PerfumeServiceImpl implements PerfumeService {

	@Autowired
    private PerfumeDao perfumeRepository;
	
	@Override
	public List<Perfume> getAllPerfumes() {
		return perfumeRepository.getPerfumes();
	}

	@Override
	public Perfume getPerfumeById(Long id) {
		return perfumeRepository.getPerfumeById(id);
	}

	@Override
	public Perfume createPerfume(String name, String brand) {
		Perfume perfume = new Perfume();
		perfume.setName(name);
        perfume.setBrand(brand);
        Long id =  perfumeRepository.addPerfume(perfume);
        perfume.setId(id);
        
        return perfume;
	}

	@Override
	public void updatePerfume(Perfume perfume) {
		perfumeRepository.updatePerfume(perfume);
		
	}

	@Override
	public void deletePerfume(Perfume perfume) {
		perfumeRepository.deletePerfume(perfume);
		
	}

}
