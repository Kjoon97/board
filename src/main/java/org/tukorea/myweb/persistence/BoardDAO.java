package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.dto.UpdateBoardDto;

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
	
	

}
