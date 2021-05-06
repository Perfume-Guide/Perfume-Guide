package kr.ac.hansung.exception;

public class NotFoundException extends RuntimeException {

	private static final long serialVersionUID = 8795546082074185666L;

	private Long Id;
	//private String brand;

	public NotFoundException(Long Id) {
		this.Id = Id;
	}

	public long getId() {
		return Id;
	}

	/*
	 * public NotFoundException(String brand) { this.brand = brand; }
	 * 
	 * public String getBrand() { return brand; }
	 */

}
