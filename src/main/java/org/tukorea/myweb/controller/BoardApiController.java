package org.tukorea.myweb.controller;

import java.io.File;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.tukorea.myweb.domain.BoardVO;
import org.tukorea.myweb.dto.ResponseDto;
import org.tukorea.myweb.dto.SaveBoardDto;
import org.tukorea.myweb.service.BoardService;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BoardApiController {
	
	private final BoardService boardService;
	
    //글 작성
    @PostMapping("/api/board")
    public ResponseDto<Integer> save(@RequestBody SaveBoardDto saveBoardDto) throws Exception{
    	BoardVO boardVO = saveBoardDto.toEntity();
    	System.out.println(boardVO.getWriter());
        boardService.addBoard(boardVO);
    	System.out.println("글작성");
    	System.out.println(saveBoardDto.getTitle());
    	return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }
    //글 삭제
    @DeleteMapping("/api/board/{id}")
    public ResponseDto<Integer> deleteById(@PathVariable int id) throws Exception{
    	System.out.println("삭제한 id: "+ id);
    	boardService.deleteBoard(id);
    	return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

}
