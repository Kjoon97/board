package org.tukorea.myweb.dto;

import org.tukorea.myweb.domain.BoardVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

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