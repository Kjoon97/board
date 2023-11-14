package com.lottetour.web.controller;

import java.io.File;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lottetour.web.domain.BoardVO;
import com.lottetour.web.dto.Password;
import com.lottetour.web.dto.ResponseDto;
import com.lottetour.web.dto.SaveBoardDto;
import com.lottetour.web.dto.UpdateBoardDto;
import com.lottetour.web.service.BoardService;
import com.lottetour.web.util.Encrypt;

import lombok.RequiredArgsConstructor;

/**
* @package com.lottetour.web.Controller
* @class   rest통신을 위한 Controller
* @author  강준혁
* @since   2023.11.03.
* @see
*
* <pre>
* << 개정이력(Modification Information) >> *
*   수정일         수정자           수정내용
*  ------------    ---------    ---------------------------
*   2023. 11. 03.    강준혁          최초 생성
*   2023. 11. 0.6         강준혁 	    글 작성 -save(), 글 삭제 -deleteById() 생성.
*   2023. 11. 0.7         강준혁 	    글 수정 -update() 생성.
*   
* </pre>
*/


@RestController
@RequiredArgsConstructor
public class BoardApiController {
	
	private final BoardService boardService;
	private final Encrypt encrypt;
	
    //글 작성
    @PostMapping("/api/board")
    public ResponseDto<Integer> save(@RequestBody SaveBoardDto saveBoardDto) throws Exception{
    
    	BoardVO boardVO = saveBoardDto.toEntity();
    	String salt = encrypt.getSalt();
    	String encodedPasswd = encrypt.getEncrypt(saveBoardDto.getPasswd(),salt);
    	boardVO.registerSalt(salt);
    	boardVO.registerPassword(encodedPasswd);
    	System.out.println(saveBoardDto.getUserId());
    	System.out.println(boardVO.getUserId());
        boardService.addBoard(boardVO);
    	System.out.println("글작성");
    	System.out.println(saveBoardDto.getTitle());
    	return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }
    //글 삭제
    @PatchMapping("/api/board/{id}")
    public ResponseDto deleteById(@PathVariable int id, @RequestBody Password password) throws Exception{
    	ResponseDto response = boardService.checkPasswd(id, password);
    	System.out.println("삭제한 id: "+ id);
    	//boardService.deleteBoard(id);
    	return response;
    }
    
    //글 수정하기
    @PutMapping("/api/board/{id}")
    public ResponseDto update(@PathVariable int id, @RequestBody UpdateBoardDto updateBoardDto) throws Exception{
    	ResponseDto response = boardService.update(id, updateBoardDto);
    	System.out.println(response.getStatusCode());
    	System.out.println(response.getData());
        return response;
    }

}
