package kr.ac.hansung.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/*
 * Category와 childCategories 관계는 1:n으로 매핑
 * Product와 Category는 N:N으로 매핑
*/

@Getter
@Setter
@ToString

@Entity
@Table(name="perfume")
public class Perfume extends AbstractEntity{


	//@Column(name = "brand", nullable = false)
	//private String brand;	
	

	@Column(name = "name", nullable = false)
	private String name;	

	/*
	 * @Column(name = "gender") private String gender;
	 * 
	 * @Column(name = "power") private String power;
	 * 
	 * @Column(name = "top1") private String top1;
	 * 
	 * @Column(name = "top2") private String top2;
	 * 
	 * @Column(name = "top3") private String top3;
	 * 
	 * @Column(name = "middle1") private String middle1;
	 * 
	 * @Column(name = "middle2") private String middle2;
	 * 
	 * @Column(name = "middle3") private String middle3;
	 * 
	 * @Column(name = "bottom1") private String bottom1;
	 * 
	 * @Column(name = "bottom2") private String bottom2;
	 * 
	 * @Column(name = "bottom3") private String bottom3;
	 * 
	 * @Column(name = "niche") private String niche;
	 */
	
	//@Column(name = "accord")
	//private String accord;
	
	
}