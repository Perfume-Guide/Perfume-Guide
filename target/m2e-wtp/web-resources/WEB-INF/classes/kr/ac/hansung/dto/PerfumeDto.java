package kr.ac.hansung.dto;

import lombok.Getter;

//@Setter
@Getter
public class PerfumeDto {

	private String brand;

	//@NotNull(message = "name is required")
	//@Size(message = "name must be equal to or lower than 100", min = 1, max = 100)
	private String name;	
	
	private String gender;

	private String power;
	private String top1;
	private String top2;
	private String top3;

	private String middle1;
	private String middle2;
	private String middle3;

	private String bottom1;
	private String bottom2;
	private String bottom3;

	private String niche;

	private String accord;
	private String eng_brand;
	
}
