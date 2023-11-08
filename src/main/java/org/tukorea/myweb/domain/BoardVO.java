package org.tukorea.myweb.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
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
	private String userId;
	
	//조회 수 
	private int viewCount;
	
	public void updateBoard(String title, String content, String userId, int viewCount) {
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.viewCount = viewCount;
	}

}
