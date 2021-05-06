package kr.ac.hansung.exception;

public class NotFoundException extends RuntimeException {
	
	
	private static final long serialVersionUID = 8795546082074185666L;
	
	private Long id;
	
	public NotFoundException(Long id) {
		this.id = id;
	}
	
	public Long getId() {
		return id;
	}
}
