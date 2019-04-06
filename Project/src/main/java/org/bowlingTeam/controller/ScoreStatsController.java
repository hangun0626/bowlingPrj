package org.bowlingTeam.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.bowlingTeam.domain.ScoreStatsVO;
import org.bowlingTeam.service.ScoreStatsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller //스프링에 컨트롤 빈 등록
public class ScoreStatsController {

	@Inject
	private ScoreStatsService scoreStatsService;
		
	//목록보기
	@RequestMapping("/scoreStats_list")
	//get or post 방식으로 접근하는 매핑주소를 처리
	public ModelAndView scoreStats_list(
			@ModelAttribute ScoreStatsVO b,
			HttpServletRequest request) {

		List<ScoreStatsVO> blist=this.scoreStatsService.getScoreStatsList(b);
		//목록

		ModelAndView listM=new ModelAndView();
		listM.addObject("blist",blist);
        
		listM.setViewName("scoreStats/scoreStats_list");//뷰페이지 폴더
		//경로와 파일명 지정
		return listM;
	}
}

