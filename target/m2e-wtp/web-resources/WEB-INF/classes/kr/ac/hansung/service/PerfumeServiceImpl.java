package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.dto.PerfumeDto;
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
	public List<Perfume> getPerfumesByBrand(String brand) {
		return perfumeRepository.getPerfumesByBrand(brand);
	}

	@Override
	public List<Perfume> getPerfumesByAccord(String accord) {
		return perfumeRepository.getPerfumesByAccord(accord);
	}

	@Override
	public List<Perfume> getPerfumesByName(String name) {
		return perfumeRepository.getPerfumesByName(name);
	}

	@Override
	public List<Perfume> getPerfumesByGender(String gender) {
		return perfumeRepository.getPerfumesByGender(gender);
	}

	@Override
	public List<Perfume> getPerfumesByPower(String power) {
		return perfumeRepository.getPerfumesByPower(power);
	}

	@Override
	public List<Perfume> getPerfumesByNote(String note) {
		return perfumeRepository.getPerfumesByNote(note);
	}

	@Override
	public List<Perfume> getPerfumesByEngBrand(String eng_brand) {
		return perfumeRepository.getPerfumesByEngBrand(eng_brand);
	}

	@Override
	public List<Perfume> getPerfumesByBrandAndName(String brand, String name) {
		return perfumeRepository.getPerfumesByBrandAndName(brand, name);
	}
	
	@Override
	public Perfume createPerfume(PerfumeDto request) {
		Perfume perfume = new Perfume();
		perfume.setBrand(request.getBrand());
		perfume.setName(request.getName());
		perfume.setGender(request.getGender());
		perfume.setPower(request.getPower());

		perfume.setTop1(request.getTop1());
		perfume.setTop2(request.getTop2());
		perfume.setTop3(request.getTop3());

		perfume.setMiddle1(request.getMiddle1());
		perfume.setMiddle2(request.getMiddle2());
		perfume.setMiddle3(request.getMiddle3());

		perfume.setBottom1(request.getBottom1());
		perfume.setBottom2(request.getBottom2());
		perfume.setBottom3(request.getBottom3());

		perfume.setNiche(request.getNiche());
		perfume.setAccord(request.getAccord());
		perfume.setEng_brand(request.getEng_brand());

		Long id = perfumeRepository.addPerfume(perfume);
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
