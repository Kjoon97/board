package org.tukorea.myweb.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.dto.SaveBoardDto;
import org.tukorea.myweb.persistence.BoardDAO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {
	
	private final BoardDAO boardDAO;
	
	public void addBoard(BoardVO board) throws Exception {
		boardDAO.add(board);
	}
	
	public List<BoardVO> readBoardList() throws Exception {
		return boardDAO.readList();
	}
	
	public BoardVO readBoardDetail(int id) throws Exception {
		System.out.println(id);
		return boardDAO.readDetail(id);
	}
	
	public void deleteBoard(int id) throws Exception {
		boardDAO.deleteById(id);
	}
	
}
