package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.dto.PerfumeDto;
import kr.ac.hansung.entity.Perfume;


public interface PerfumeService {

	List<Perfume> getAllPerfumes();
	
	Perfume getPerfumeById(Long id);
	
	List<Perfume> getPerfumesByBrand(String brand);
	
	//Perfume createPerfume(String brand, String name);
	Perfume createPerfume(PerfumeDto request);

    void updatePerfume(Perfume category);

    void deletePerfume(Perfume category);
}
