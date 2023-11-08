package org.tukorea.myweb.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.domain.Criteria;
import org.tukorea.myweb.dto.PageDTO;
import org.tukorea.myweb.service.BoardService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService bs;
	
	
	//게시물 리스트
	@GetMapping(value="/list")
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
		model.addAttribute("board",board);
		return "board/modify";
	}
	
//	@GetMapping("/list") // 조회하는 경우에는 get방식을 사용
//	public void list(Criteria cri, Model model) {
//	    model.addAttribute("list", bs.getList(cri));
//	    model.addAttribute("pageMaker", new PageDTO(cri,123));
//	}
//	

}
