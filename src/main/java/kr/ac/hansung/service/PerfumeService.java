package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.Perfume;


public interface PerfumeService {

	List<Perfume> getAllPerfumes();
	
	Perfume getPerfumeById(Long id);
	
	//List<Perfume> getPerfumeByBrand();
	
	Perfume createPerfume(String name, String brand);

    void updatePerfume(Perfume perfume);

    void deletePerfume(Perfume perfume);
}
