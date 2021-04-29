package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.entity.Perfume;


public interface PerfumeService {

	List<Perfume> getAllPerfumes();
	
	Perfume getPerfumeByName(String name);
	
	Perfume createPerfume(String name);

    void updatePerfume(Perfume category);

    void deletePerfume(Perfume category);
}
