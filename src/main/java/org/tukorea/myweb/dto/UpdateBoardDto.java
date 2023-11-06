package org.tukorea.myweb.dto;

import org.tukorea.myweb.domain.BoardVO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class UpdateBoardDto {

    private String title;
    private String content;
    private String writer;
    
    @Builder
    public UpdateBoardDto(String title, String content, String writer){
        this.title = title;
        this.content =content;
        this.writer=writer;
    }

    public BoardVO toEntity(){
        return BoardVO.builder()
                .title(title)
                .content(content)
                .writer(writer)
                .build();
    }
    
}