package kr.ac.hansung.entity;

import java.util.Objects;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass

public class AbstractEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	/*
	 * @Override public boolean equals(Object obj) { if (this == obj) { return true;
	 * } if (obj == null || this.getClass() != obj.getClass()) { return false; }
	 * return Objects.equals(this.name, AbstractEntity.class.cast(obj).name); }
	 * 
	 * @Override public int hashCode() { return Objects.hashCode(name); }
	 */

}
