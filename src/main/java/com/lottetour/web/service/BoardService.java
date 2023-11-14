package com.lottetour.web.service;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.lottetour.web.domain.BoardVO;
import com.lottetour.web.domain.Criteria;
import com.lottetour.web.dto.Password;
import com.lottetour.web.dto.ResponseDto;
import com.lottetour.web.dto.SaveBoardDto;
import com.lottetour.web.dto.UpdateBoardDto;
import com.lottetour.web.persistence.BoardDAO;
import com.lottetour.web.util.Encrypt;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
* @package com.lottetour.web.service
* @class   게시물 CRUD를 위한 Service
* @author  강준혁
* @since   2023.11.03.
* @see
*
* <pre>
* << 개정이력(Modification Information) >> *
*   수정일         수정자           수정내용
*  ------------    ---------    ---------------------------
*   2023. 11. 03.    강준혁          최초 생성
*   2023. 11. 0.6         강준혁 	    글 작성 -addBoard(), 글 삭제 -deleteBoard(), 글 목록 조회: readBoardList() 생성.
*   2023. 11. 0.7         강준혁 	    글 수정:update() 생성. 조회 수 증가:updateViewCnt() 생성.
*   2023. 11. 0.8         강준혁 	    페이징 읽어오기: getList(), 총 게시물 수 구하기: getTotalCount() 생성.
*   
* </pre>
*/


@Service
@RequiredArgsConstructor
@Slf4j
public class BoardService {
	
	private final BoardDAO boardDAO;
	private final Encrypt encrypt;
	
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
	
	public ResponseDto update(int id, UpdateBoardDto updateBoardDto) throws Exception {
		
		BoardVO boardVO = boardDAO.readDetail(id);
		String storedSalt = boardVO.getSalt();
		String storedPasswd = boardVO.getPasswd();
		String inputPasswd = updateBoardDto.getPasswd();
		
		String inputEncodedPasswd = encrypt.getEncrypt(inputPasswd, storedSalt);
		
		if (storedPasswd.equals(inputEncodedPasswd)) {
			boardVO.updateBoard(updateBoardDto.getTitle(), updateBoardDto.getContent(), updateBoardDto.getUserId(), updateBoardDto.getViewCount());
			boardDAO.updateBoard(boardVO);
			System.out.println("성공했습니다.");
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		} else {
			System.out.println("실패했습니다.");
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "잘못된 비밀번호입니다.");
		}
		
	}
	
	public ResponseDto checkPasswd(int id, Password password) throws Exception {
		BoardVO boardVO = boardDAO.readDetail(id);
		String storedSalt = boardVO.getSalt();
		String storedPasswd = boardVO.getPasswd();
		
		String inputEncodedPasswd = encrypt.getEncrypt(password.getPasswd(), storedSalt); 
		
		if (storedPasswd.equals(inputEncodedPasswd)) {
			System.out.println("성공했습니다.");
			boardDAO.deleteById(id);
			return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
		} else {
			System.out.println("실패했습니다.");
			return new ResponseDto<String>(HttpStatus.BAD_REQUEST.value(), "잘못된 비밀번호입니다.");
		}
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
