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
    private String userId;
    private int viewCount;
    
    @Builder
    public UpdateBoardDto(String title, String content, String userId, int viewCount){
        this.title = title;
        this.content =content;
        this.userId=userId;
        this.viewCount = viewCount;
    }

    public BoardVO toEntity(){
        return BoardVO.builder()
                .title(title)
                .content(content)
                .userId(userId)
                .viewCount(viewCount)
                .build();
    }
    
}