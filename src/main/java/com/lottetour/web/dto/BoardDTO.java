package com.lottetour.web.dto;

import java.util.Date;

import com.lottetour.web.domain.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class BoardDTO {
	
	public BoardDTO(int id, String title, String content, Date regDate) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
	}
	
	//게시판 번호
	private int id;
	
	//게시판 제목
	private String title;
	
	//게시판 내용
	private String content;
	
	//등록 날짜
	private Date regDate;
	
	//수정 날짜
	private Date updateDate;
	
	//삭제 날짜
	private Date deleteDate;
	
	//등록자 계정
	private String userId;
	
	//조회 수 
	private int viewCount;
	
	//삭제 유무 
	private int isDeleted;
	
	//비밀 번호.
	private String passwd;
	
	//salt
	private String salt;

}
