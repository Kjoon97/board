package com.lottetour.web.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.lottetour.web.domain.BoardVO;
import com.lottetour.web.domain.Criteria;

import lombok.RequiredArgsConstructor;

/**
* @package com.lottetour.web.persistence
* @class   게시물 테이블에 접근하기 위한 객체 DAO
* @author  강준혁
* @since   2023.11.03.
* @see
*
* <pre>
* << 개정이력(Modification Information) >> *
*   수정일         수정자           수정내용
*  ------------    ---------    ---------------------------
*   2023. 11. 03.    강준혁          최초 생성
*   2023. 11. 0.6         강준혁 	    글 작성:add(), 글 삭제:deleteById(), 글 목록 조회:readList() 생성.
*   2023. 11. 0.7         강준혁 	    글 수정:updateBoard() 생성. 조회 수 증가:updateViewCount() 생성.
*   2023. 11. 0.8         강준혁 	    페이징: getListWithPaging(), 총 게시물 수 구하기: getTotalCount() 생성.
* </pre>
*/


@Repository
@RequiredArgsConstructor
public class BoardDAO {
	
	private final SqlSession sqlSession;
	
	private static final String namespace = "com.lottetour.web.mapper.BoardMapper";
	
	//글 등록.
	public void add(BoardVO board) throws Exception {
		sqlSession.insert(namespace + ".insert", board);
	}
	
	//글 목록 읽기
	public List<BoardVO> readList() throws Exception {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		Map<String, String> map = new HashMap<String, String>();
		boardList = sqlSession.selectList(namespace + ".selectAll");
		return boardList;
	}
	
	//상세보기
	public BoardVO readDetail(int id) throws Exception {
		System.out.println(id);
		BoardVO boardvo = sqlSession.selectOne(namespace+".selectByid", id);
		return boardvo;
	}
	
	//글 삭제
	public void deleteById(int id) throws Exception {
		sqlSession.delete(namespace + ".delete", id);
	}
	
	//글 수정
	public void updateBoard(BoardVO board) throws Exception {
		sqlSession.update(namespace + ".update", board);
	}
	
	//조회수 증가
	public void updateViewCount(int id) throws Exception {
		sqlSession.update(namespace + ".updateviewcount", id); 
	};
	
	//페이징
	public List<BoardVO> getListWithPaging(Criteria cri){
		return sqlSession.selectList(namespace + ".getListWithPaging", cri);
	}
	
	//전체 수
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne(namespace+ ".getTotalCount", cri);
	}
	

}
