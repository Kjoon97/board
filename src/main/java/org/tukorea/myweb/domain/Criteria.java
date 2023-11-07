package org.tukorea.myweb.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


//파라미터들을 맡아서 관리하는 클래스

@Data
public class Criteria {
	
	private String keyword;
}
