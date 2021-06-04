package kr.ac.hansung.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

@Entity
@Table(name = "perfume")
public class Perfume {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="perfume_id")
	private Long id;
	
	
	// private static final long serialVersionUID = 1L;
	
	@Column(name = "perfume_brand", nullable = false)
	private String brand;

	@Column(name = "perfume_name", nullable = false)
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
	
	// imgurl

}
