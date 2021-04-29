package kr.ac.hansung.exception;

public class NotFoundException extends RuntimeException {
	
	
	private static final long serialVersionUID = 8795546082074185666L;
	
	private String Name;
	
	public NotFoundException(String Name) {
		this.Name = Name;
	}
	
	public String getName() {
		return Name;
	}
}
