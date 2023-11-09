package com.lottetour.web.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;


/**
* @package com.lottetour.web.domain
* @class   게시물 데이터를 저장하기 위한 VO
* @author  강준혁
* @since   2023.11.03.
* @see
*
* <pre>
* << 개정이력(Modification Information) >> *
*   수정일         수정자           수정내용
*  ------------    ---------    ---------------------------
*   2023. 11. 03.    강준혁          최초 생성
*   2023. 11. 0.6         강준혁 	    글 작성 -save(), 글 삭제 -deleteById() 생성.
* </pre>
*/



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
