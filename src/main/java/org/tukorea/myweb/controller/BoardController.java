package org.tukorea.myweb.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.domain.Criteria;
import org.tukorea.myweb.service.BoardService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService bs;
	
	
	//게시물 리스트
	@GetMapping(value="/")
	public String home(@RequestParam(defaultValue = "title") String searchOption, @RequestParam(defaultValue="") String keyword, Model model) throws Exception {
		List<BoardVO> boardList = bs.readBoardList(searchOption, keyword);	   
		
		for (BoardVO b: boardList) {
			System.out.println(b.getViewCount());
		}
		
		model.addAttribute("boards", boardList);	
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
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
	

}
