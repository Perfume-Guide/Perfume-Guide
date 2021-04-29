package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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

	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<?> retrieveAllPerfumes() {
		// Getting all categories in application...
		final List<Perfume> perfumes = perfumeService.getAllPerfumes();

		if (perfumes.isEmpty()) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}

		return ResponseEntity.ok(perfumes);
		
	}

	@RequestMapping(path = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<?> retrieveCategory(@PathVariable Long id) {
		Perfume perfume = perfumeService.getPerfumeById(id);
		
		if(perfume == null) {
			throw new NotFoundException(id);
		}
		
		return new ResponseEntity<Perfume>(perfume, HttpStatus.OK);
	}

	// DTO(Data Transfer Object) : ������ ������ ��ȯ�� ���� ��ü, ���⼭�� Ŭ���̾�Ʈ(Postman)���� ���� �����͸�
	// ������ �������� ���
	// Category�� CategoryDto���� ���̸� ���ؼ� ���캸�� �ٶ�
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<?> createPerfume(@RequestBody @Valid PerfumeDto request) {

		// Creating a new category in the application...
		final Perfume perfume = perfumeService.createPerfume(request.getName(), request.getBrand());

		return ResponseEntity.status(HttpStatus.CREATED).body(perfume);
	}

	@RequestMapping(path = "/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateCategory(@PathVariable Long id, @RequestBody @Valid PerfumeDto request) {
		
		Perfume currentPerfume = perfumeService.getPerfumeById(id);
		
		if(currentPerfume == null) {
			throw new NotFoundException(id);
		}
		
		currentPerfume.setName(request.getName());
		currentPerfume.setBrand(request.getBrand());
		
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

	static class PerfumeDto {
		@NotNull(message = "name is required")
		@Size(message = "name must be equal to or lower than 100", min = 1, max = 100)
		private String name;
		private String brand;
		
		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		public String getBrand() {
			return brand;
		}

		public void setBrand(String brand) {
			this.brand = brand;
		}
	}

}