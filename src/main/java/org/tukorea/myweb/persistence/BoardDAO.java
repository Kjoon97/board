package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.domain.Criteria;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDAO {
	
	private final SqlSession sqlSession;
	
	private static final String namespace = "org.tukorea.myweb.mapper.BoardMapper";
	
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
	
	//criteria
	public List<BoardVO> getListWithPaging(Criteria cri){
		return sqlSession.selectList(namespace + ".getListWithPaging", cri);
	}
	
	//전체 수
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne(namespace+ ".getTotalCount", cri);
	}
	

}
