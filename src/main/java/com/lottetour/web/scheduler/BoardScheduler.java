package com.lottetour.web.scheduler;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.lottetour.web.persistence.BoardDAO;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class BoardScheduler {
	
	private final BoardDAO boardDAO;
	private static final Logger logger = LoggerFactory.getLogger(BoardScheduler.class);
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	String dateString = now.format(formatter);
	
	
// 	@Scheduled(cron = "0 47 14 * * ?")    //매일 2시 47분
	@Scheduled(cron = "0 0 11 * * ?")  //매일 오전 11시
	public void DeleteBoard() throws Exception {
		logger.info("삭제 스케쥴러 실행 " + dateString);
		boardDAO.DeleteListByDate(dateString);
	}

}
