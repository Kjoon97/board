package com.lottetour.web.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import com.lottetour.web.domain.BoardVO;
import com.lottetour.web.domain.Criteria;
import com.lottetour.web.dto.PasswordDTO;
import com.lottetour.web.dto.ResponseDTO;
import com.lottetour.web.dto.SaveBoardDTO;
import com.lottetour.web.dto.UpdateBoardDTO;
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
*       수정일                 수정자                수정내용
*  ------------    ---------    ---------------------------
*   2023. 11. 03     강준혁               최초 생성
*   2023. 11. 06          강준혁 	          글 작성 -addBoard(), 글 삭제 -deleteBoard(), 글 목록 조회: readBoardList() 생성.
*   2023. 11. 07          강준혁 	          글 수정:update() 생성. 조회 수 증가:updateViewCnt() 생성.
*   2023. 11. 08          강준혁 	          페이징 읽어오기: getList(), 총 게시물 수 구하기: getTotalCount() 생성.
*   2023. 11. 22     강준혁               id로 게시글 조회 메소드 추가 (패키지/프로시저 활용) : getBoardByProc(int id)
*   2023. 11. 23     강준혁               삭제 스케줄러 실행 메소드 추가: executeDeleteSchedule()
* </pre>
*/


@Service
@RequiredArgsConstructor
public class BoardService {
	
	private final BoardDAO boardDAO;
	private final Encrypt encrypt;
	
	//게시물 추가
	public void addBoard(BoardVO board) throws Exception {
		boardDAO.add(board);
	}
	
	//게시물 목록 조회
	public List<BoardVO> readBoardList() throws Exception {
		return boardDAO.readList();
	}
	
	//게시물 상세보기.
	public BoardVO readBoardDetail(int id) throws Exception {
		return boardDAO.readDetail(id);
	}
	
	//게시물 삭제.
	public void deleteBoard(int id) throws Exception {
		boardDAO.deleteById(id);
	}
	
	//게시물 수정
	public ResponseDTO<?> update(int id, UpdateBoardDTO updateBoardDto) throws Exception {
		
		BoardVO boardVO = boardDAO.readDetail(id);
		String storedSalt = boardVO.getSalt();
		String storedPasswd = boardVO.getPasswd();
		String inputPasswd = updateBoardDto.getPasswd();
		
		String inputEncodedPasswd = encrypt.getEncrypt(inputPasswd, storedSalt);
		
		if (storedPasswd.equals(inputEncodedPasswd)) {
			boardVO.updateBoard(updateBoardDto.getTitle(), updateBoardDto.getContent(), updateBoardDto.getUserId(), updateBoardDto.getViewCount(), updateBoardDto.getDeleteDate());
			boardDAO.updateBoard(boardVO);
			return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
		} else {
			return new ResponseDTO<String>(HttpStatus.BAD_REQUEST.value(), "잘못된 비밀번호입니다.");
		}
		
	}
	
	//비밀번호 확인.
	public ResponseDTO<?> checkPasswd(int id, PasswordDTO password) throws Exception {
		BoardVO boardVO = boardDAO.readDetail(id);
		String storedSalt = boardVO.getSalt();
		String storedPasswd = boardVO.getPasswd();
		
		String inputEncodedPasswd = encrypt.getEncrypt(password.getPasswd(), storedSalt); 
		
		if (storedPasswd.equals(inputEncodedPasswd)) {
			boardDAO.deleteById(id);
			return new ResponseDTO<Integer>(HttpStatus.OK.value(), 1);
		} else {
			return new ResponseDTO<String>(HttpStatus.BAD_REQUEST.value(), "잘못된 비밀번호입니다.");
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
	
	//전체 게시글 수 읽어오기
	public int getTotalCount(Criteria cri) {
		return boardDAO.getTotalCount(cri);
	}
	
	//id로 게시글 조회 (패키지/프로시저 활용)
	public ArrayList<BoardVO> getBoardByProc(int id){
		Map<String, Object> param  = boardDAO.getBoardByProc(id);
		@SuppressWarnings("unchecked")
		ArrayList<BoardVO> boardlist = (ArrayList<BoardVO>) param.get("p_result");
		return boardlist;
	}
	
	//삭제 스케줄러 실행
    public void executeDeleteSchedule() {
        boardDAO.executeDeleteSchedule();
    }
	
}
