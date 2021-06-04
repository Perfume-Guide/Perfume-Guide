package kr.ac.hansung.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "perfume_detail")
public class PerfumeDetail {
	
	
	@Id
	private Long id;
	
	@OneToOne(optional=false, cascade=CascadeType.ALL)
	@MapsId
	@JoinColumn(unique=true, name="perfume_id")
	private Perfume perfume;
	
	@Column(name="explanation")
	private String explanation;
	
	@Column(name="link")
	private String link;
	
}
