package kr.ac.hansung.service;

import java.util.List;

import kr.ac.hansung.dto.PerfumeDto;
import kr.ac.hansung.entity.Perfume;

public interface PerfumeService {

	List<Perfume> getAllPerfumes();

	Perfume getPerfumeById(Long id);

	List<Perfume> getPerfumesByBrand(String brand);

	List<Perfume> getPerfumesByName(String name);
	
	List<Perfume> getPerfumesByBrandAndName(String brand, String name);

	List<Perfume> getPerfumesByAccord(String accord);

	List<Perfume> getPerfumesByGender(String gender);

	List<Perfume> getPerfumesByPower(String power);

	List<Perfume> getPerfumesByNote(String note);
	
	List<Perfume> getPerfumesByEngBrand(String eng_brand);

	Perfume createPerfume(PerfumeDto request);

	void updatePerfume(Perfume category);

	void deletePerfume(Perfume category);
}
