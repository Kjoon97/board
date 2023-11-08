package org.tukorea.myweb.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.domain.Criteria;
import org.tukorea.myweb.dto.SaveBoardDto;
import org.tukorea.myweb.dto.UpdateBoardDto;
import org.tukorea.myweb.persistence.BoardDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
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
	
	public void update(int id, UpdateBoardDto updateBoardDto) throws Exception {
		
		BoardVO boardVO = boardDAO.readDetail(id);
		boardVO.updateBoard(updateBoardDto.getTitle(), updateBoardDto.getContent(), updateBoardDto.getUserId(), updateBoardDto.getViewCount());
		boardDAO.updateBoard(boardVO);
	}
	
	//조회 수 증가
	public void updateViewCnt(int id) throws Exception {
		boardDAO.updateViewCount(id);
	}
	
	//페이징 읽어오기.
	public List<BoardVO> getList(Criteria cri) {
	    return boardDAO.getListWithPaging(cri);
	}
	
	//전체 수 읽어오기
	public int getTotalCount(Criteria cri) {
		return boardDAO.getTotalCount(cri);
	}
	
}
