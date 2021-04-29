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
/*
 * ���������� ��ӹ޴� Superclass��� �ǹ��� @MappedSuperclass ������̼� 
 * ���� ���� ����(id)�� �ʿ��� ��, �θ� Ŭ������ �����ϰ� 
 * �Ӽ��� ��� �޾Ƽ� ����ϰ� ���� �� @MappedSuperclass�� ���
 * @MappedSuperclass�� ����Ǿ� �ִ� Ŭ������ ��ƼƼ�� �ƴϱ� ������ �翬�� ���̺�� ���ε� �ȵȴ�.  
 * ��, �ܼ��� �θ� Ŭ������ ��� �޴� �ڽ� Ŭ������ ���� ������ �����Ѵ�.
 */

public class AbstractEntity {

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private String name;
   
    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || this.getClass() != obj.getClass()) {
            return false;
        }
        return Objects.equals(this.name, AbstractEntity.class.cast(obj).name);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(name);
    }
}