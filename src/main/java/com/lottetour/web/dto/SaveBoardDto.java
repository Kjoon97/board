package com.lottetour.web.dto;

import com.lottetour.web.domain.BoardVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
* @package com.lottetour.web.dto
* @class   게시물 등록할 때 입력 데이터를 담는 DTO
* @author  강준혁
* @since   2023.11.03.
* @see
*
* <pre>
* << 개정이력(Modification Information) >> *
*   수정일         수정자           수정내용
*  ------------    ---------    ---------------------------
*   2023. 11. 03.    강준혁          최초 생성
* </pre>
*/


@NoArgsConstructor
@Getter
public class SaveBoardDto {

    private String title;
    private String content;
    private String userId;
    
    @Builder
    public SaveBoardDto(String title, String content, String userId){
        this.title = title;
        this.content =content;
        this.userId=userId;
    }

    public BoardVO toEntity(){
        return BoardVO.builder()
                .title(title)
                .content(content)
                .userId(userId)
                .build();
    }
    
}