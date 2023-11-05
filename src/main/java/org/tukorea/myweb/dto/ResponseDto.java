package org.tukorea.myweb.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@Getter
public class ResponseDto<T> {
    int statusCode;
    T data;

    //상태 코드만 리턴하고 싶을 때 사용.
    public ResponseDto(int statusCode){
        super();
        this.statusCode = statusCode;
    }

    //상태 코드, 데이터를 리턴 하고 싶을 때 사용.
    public ResponseDto(int statusCode, T data){
        super();
        this.statusCode =statusCode;
        this.data =data;
    }
}