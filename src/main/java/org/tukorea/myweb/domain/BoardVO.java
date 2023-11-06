package org.tukorea.myweb.domain;

import java.util.Date;

import org.tukorea.myweb.dto.SaveBoardDto.SaveBoardDtoBuilder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardVO {

	//게시판 번호
	private int id;
	
	//게시판 제목
	private String title;
	
	//게시판 내용
	private String content;
	
	//등록 날짜
	private Date regdate;
	
	//수정 날짜
	private Date updatedate;
	
	//등록자 계정
	private String writer;
	
	public void updateBoard(String title, String content, String writer) {
		this.title = title;
		this.content = content;
		this.writer = writer;
	}

}
