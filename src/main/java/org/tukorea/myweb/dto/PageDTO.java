package org.tukorea.myweb.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.tukorea.myweb.domain.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


//페이지 번호 출력하는 클래스  startPage(시작페이지), endPage(끝 페이지), prev(이전 버튼 활성화 여부), next(다음 버튼 활성화 여부)

@Getter
@Setter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;

	public PageDTO(Criteria _criteria, int _total) {
		this.cri = _criteria;
		this.total = _total;
		this.endPage = (int) (Math.ceil(_criteria.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		int realEnd = (int) (Math.ceil((_total * 1.0) / _criteria.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
