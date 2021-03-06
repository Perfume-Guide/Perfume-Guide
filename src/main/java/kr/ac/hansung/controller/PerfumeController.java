package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.hansung.dto.PerfumeDto;
import kr.ac.hansung.entity.Perfume;
import kr.ac.hansung.exception.NotFoundException;
import kr.ac.hansung.service.PerfumeService;

/* URL: /api/categories
To get list of categories:  GET "http://localhost:8080/ecommerce/api/categories"
To get category info:  GET "http://localhost:8080/ecommerce/api/categories/{id}"
To create category: POST "http://localhost:8080/ecommerce/api/categories" -d '{ "name": "C1" }'
To update category:  PUT "http://localhost:8080/ecommerce/api/categories/{id}" -d '{ "name": "C1" }'
To delete category: DELETE "http://localhost:8080/ecommerce/api/categories/{id}"
*/

@RestController
@RequestMapping(path = "/api/perfumes")
public class PerfumeController {

	@Autowired
	private PerfumeService perfumeService;

	/*
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<?> retrieveAllPerfumes() {
		// Getting all categories in application...
		final List<Perfume> perfumes = perfumeService.getAllPerfumes();

		if (perfumes.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}

		return ResponseEntity.ok(perfumes);
		
	}	
	*/
	
	@RequestMapping(path = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> retrievePerfume(@PathVariable Long id) {
		Perfume perfume = perfumeService.getPerfumeById(id);
		
		if(perfume == null) {
			throw new NotFoundException(id);
		}
		
		return new ResponseEntity<Perfume>(perfume, HttpStatus.OK);
	}
	
	// ?????? requestParm ?
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<?> retrievePerfumeByBrand(@RequestParam("brand")String brand){
		final List<Perfume> perfumes = perfumeService.getPerfumesByBrand(brand);
		
		if(perfumes.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		
		return ResponseEntity.ok(perfumes);
		
	}
	 
	
	
	
	
	
	
	
	// DTO(Data Transfer Object) : ????????? ????????? ????????? ?????? ??????, ???????????? ???????????????(Postman)?????? ?????? ????????????
	// ????????? ???????????? ??????
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<?> createPerfume(@RequestBody @Valid PerfumeDto request) {

		// Creating a new category in the application...
		
		// ????????? ????????? ?????? ??????... ?????????????
		//final Perfume perfume = perfumeService.createPerfume(request.getBrand(), request.getName());
		final Perfume perfume = perfumeService.createPerfume(request);

		return ResponseEntity.status(HttpStatus.CREATED).body(perfume);
	}

	@RequestMapping(path = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateCategory(@PathVariable Long id, @RequestBody @Valid PerfumeDto request) {
		
		Perfume currentPerfume = perfumeService.getPerfumeById(id);
		
		if(currentPerfume == null) {
			throw new NotFoundException(id);
		}
		
		currentPerfume.setBrand(request.getBrand());
		currentPerfume.setName(request.getName());
		currentPerfume.setGender(request.getGender());
		currentPerfume.setPower(request.getPower());
		
		currentPerfume.setTop1(request.getTop1());
		currentPerfume.setTop2(request.getTop2());
		currentPerfume.setTop3(request.getTop3());
		
		currentPerfume.setMiddle1(request.getMiddle1());
		currentPerfume.setMiddle2(request.getMiddle2());
		currentPerfume.setMiddle3(request.getMiddle3());
		
		currentPerfume.setBottom1(request.getBottom1());
		currentPerfume.setBottom2(request.getBottom2());
		currentPerfume.setBottom3(request.getBottom3());
		
		currentPerfume.setNiche(request.getNiche());
		currentPerfume.setAccord(request.getAccord());
		
		perfumeService.updatePerfume(currentPerfume);
		
		return new ResponseEntity<Perfume>(currentPerfume, HttpStatus.OK);
	}

	@RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deletePerfume(@PathVariable Long id) {

		// Getting the requiring category; or throwing exception if not found
		final Perfume perfume = perfumeService.getPerfumeById(id);

		if (perfume == null)
			throw new NotFoundException(id);

		// Deleting category from the application...
		perfumeService.deletePerfume(perfume);

		return ResponseEntity.noContent().build();
		// return new ResponseEntity<>(HttpStatus.NO_CONTENT);

	}

}
