package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.domain.Criteria;
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
	public List<BoardVO> readList(String searhOption, String keyword) throws Exception {
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searhOption);
		map.put("keyword", keyword);
		
		boardList = sqlSession.selectList(namespace + ".selectAll", map);
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
	
//	//페이지
//	public List<BoardVO> listPage(Criteria cri) throws Exception {
//		return sqlSession.selectList(namespace + ".listPage", cri);
//	}
//	
//	//게시물 총 개수
//	public int getTotalCount(Criteria cri) throws Exception {
//		return sqlSession.selectOne(namespace + ".gettotalcount", cri);
//	}

}
