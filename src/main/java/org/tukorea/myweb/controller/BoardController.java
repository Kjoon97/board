package org.tukorea.myweb.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.service.BoardService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService bs;
	
	
	//게시물 리스트
	@GetMapping(value="/")
	public String home(Model model) throws Exception {
		List<BoardVO> boardList = bs.readBoardList();
		
		model.addAttribute("boards", boardList);
		
		
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
		System.out.println(board.getContent());
		model.addAttribute("board",board);
		return "board/detail";
	}

}
