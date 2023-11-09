package com.lottetour.web.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.lottetour.web.domain.BoardVO;
import com.lottetour.web.domain.Criteria;
import com.lottetour.web.dto.PageDTO;
import com.lottetour.web.service.BoardService;

import lombok.RequiredArgsConstructor;

/**
* @package com.lottetour.web.Controller
* @class   게시판 조회,등록, 삭제하기 위한 Controller
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
*   2023. 11. 0.7         강준혁 	    상세보기 조회: detailBoard(), 수정 페이지 조회: modifyBoard() 생성.
*   2023. 11. 0.7         강준혁 	    상세보기: detailBoard()에서 조회 수 증가 updateViewCnt() 호출.
*   2023. 11. 0.8         강준혁 	    페이징, 검색을 위해 home()에서 Criteria 매개변수 추가.
* </pre>
*/


@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService bs;
	
	
	//게시물 리스트
	@GetMapping(value="/")
	public String home(Criteria cri, Model model) throws Exception {
		
//	    model.addAttribute("list", bs.getList(cri));
	    
		
		List<BoardVO> boards = bs.getList(cri);   
		
		for (BoardVO b: boards) {
			System.out.println(b.getViewCount());
		}
		model.addAttribute("boards",boards);
		model.addAttribute("pageMaker", new PageDTO(cri, bs.getTotalCount(cri))); 
		return "board/board_list";
	}
	
	//게시물 등록
	@GetMapping(value="/board/register")
	public String registerBoard() throws Exception {
		return "board/board_register";
	}
	
	//게시물 상세보기
	@GetMapping(value="/board/detail/{id}")
	public String detailBoard(@PathVariable int id, Model model) throws Exception {
		BoardVO board = bs.readBoardDetail(id);
		bs.updateViewCnt(id);
//		System.out.println(board.getContent());
		model.addAttribute("board",board);
		return "board/detail";
	}
	
	//게시물 수정페이지
	@GetMapping(value="/board/modify/{id}")
	public String modifyBoard(@PathVariable int id, Model model) throws Exception {
		BoardVO board = bs.readBoardDetail(id);
		System.out.println(board.getTitle());
		model.addAttribute("board",board);
		return "board/modify";
	}


}
