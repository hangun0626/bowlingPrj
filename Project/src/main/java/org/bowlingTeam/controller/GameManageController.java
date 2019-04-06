package org.bowlingTeam.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bowlingTeam.domain.GameManageVO;
import org.bowlingTeam.service.GameManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller //스프링에 컨트롤 빈 등록
public class GameManageController {

	@Inject
	private GameManageService gameManageService;
	
	//게임공지입력 폼
	@RequestMapping(value="/gameManage_write" ,method=RequestMethod.GET)
	//get으로 접근하는 매핑주소를 처리한다.
	public String gameManage_write(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute GameManageVO gameManageVO,
			Model m) {
		
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession();
		gameManageVO.setMemId((String)session.getAttribute("id"));
		gameManageVO.setMemName((String)session.getAttribute("memName"));
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
		}
		m.addAttribute("page",page);//키,값 쌍으로 쪽번호 저장
		return "gameManage/gameManage_write";//WEB-INF/views/gameManage/
		//gameManage_write.jsp 뷰페이지 경로와 파일명
	}//gameManage_write()
	
	//게임 등록
	@RequestMapping(value="/gameManage_write_ok", method=RequestMethod.POST)
	//POST방식으로 접근하는 매핑주소를 처리
	public ModelAndView gameManage_write_ok(
			@ModelAttribute GameManageVO b) {
		//@ModelAttribute GameManageVO b라고 하면 네임피라미터 이름과
//빈클래스 변수명이 같으면 b객체에 값이 벌써 저장됨.
		this.gameManageService.insertGameManage(b);//게시판 저장
		return new ModelAndView("redirect:/gameManage_list");
		//gameManage_list로 이동
	}//gameManage_write_ok()
	
	//게임참석
	@RequestMapping(value="/gameManage_attend", method=RequestMethod.GET)
	//POST방식으로 접근하는 매핑주소를 처리
	public ModelAndView gameManage_attend(
			@RequestParam("no") int gameId,
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute GameManageVO gameManageVO) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession();
		gameManageVO.setGameId(gameId);
		gameManageVO.setMemId((String)session.getAttribute("id"));
		gameManageVO.setMemName((String)session.getAttribute("memName"));
		this.gameManageService.attendGameManage(gameManageVO);//게임참석
		//this.gameManageService.insertScoreManage(gameManageVO);
		return new ModelAndView("redirect:/gameManage_cont?no="+gameId+"&state=cont");
		//gameManage_cont로 이동
	}//gameManage_attend()
	
	//게임취소
	@RequestMapping(value="/gameManage_cancle", method=RequestMethod.GET)
	//POST방식으로 접근하는 매핑주소를 처리
	public ModelAndView gameManage_cancle(
			@RequestParam("no") int gameId,
			HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute GameManageVO gameManageVO) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session=request.getSession();
		System.out.println(gameId);
		gameManageVO.setMemId((String)session.getAttribute("id"));
		gameManageVO.setGameId(gameId);
		this.gameManageService.cancleGameManage(gameManageVO);//게임참석
		this.gameManageService.deleteScoreGameManage(gameManageVO);//게임참석
		return new ModelAndView("redirect:/gameManage_cont?no="+gameId+"&state=cont");
		//gameManage_cont로 이동
	}//gameManage_attend()
	
	//목록보기
	@RequestMapping("/gameManage_list")
	//get or post 방식으로 접근하는 매핑주소를 처리
	public ModelAndView gameManage_list(
			@ModelAttribute GameManageVO gameManageVO,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id==null) {
			out.println("<script>alert('로그인이 필요합니다');location.href='main'</script>");
			return null;
		}
		
		int page=1;//쪽번호
		int limit=10;//한페이지에 보여지는 목록개수
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));			
					}
			String find_name=request.getParameter("find_name");//검색어
			String find_field=request.getParameter("find_field");//검색
			//필드
			gameManageVO.setFind_field(find_field);
			gameManageVO.setFind_name("%"+find_name+"%");
       //%는 오라클 와일드 카드 문자로서 하나이상의 임의의 문자와
       //매핑 대응
       
        int listcount=this.gameManageService.getListCount(gameManageVO);
		//전체 레코드 개수 또는 검색전후 레코드 개수
		//System.out.println("총 게시물수:"+listcount+"개");
		
        gameManageVO.setStartrow((page-1)*10+1);//시작행번호
        gameManageVO.setEndrow(gameManageVO.getStartrow()+limit-1);//끝행번호
		
		List<GameManageVO> gameList=this.gameManageService.getGameManageList(gameManageVO);
		//목록
		
		//총페이지수
		int maxpage=(int)((double)listcount/limit+0.95);
		//현재 페이지에 보여질 시작페이지 수(1,11,21)
		int startpage=(((int)((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30)
		int endpage=maxpage;
		if(endpage > startpage+10-1) endpage=startpage+10-1;
		
		ModelAndView listM=new ModelAndView();
		listM.addObject("gameList",gameList);//gameList
		//저장
		listM.addObject("page",page);
		listM.addObject("startpage",startpage);
		listM.addObject("endpage",endpage);
		listM.addObject("maxpage",maxpage);
        listM.addObject("listcount",listcount);	
        listM.addObject("find_field",find_field);
        listM.addObject("find_name", find_name);
        
		listM.setViewName("gameManage/gameManage_list");//뷰페이지 폴더
		//경로와 파일명 지정
		return listM;
	}
	
	/*내용보기+수정폼+답변폼+삭제폼*/
	@RequestMapping("/gameManage_cont")
	public ModelAndView gameManage_cont(
			@RequestParam("no") int gameId,
			@RequestParam("state") String state,
			HttpServletRequest request,
			HttpSession session,
			Model m,@ModelAttribute GameManageVO b)
					throws Exception{
		int page=1;
		if(request.getParameter("page") != null) {page=Integer.parseInt(request.getParameter("page"));			
		}
		System.out.println("gameId : " + gameId);
		b.setGameId(gameId);
		String memId = (String)session.getAttribute("id");
		b.setMemId(memId);
		b = gameManageService.gameManageContDetl(b);
		System.out.println("getGameCont : " + b.getGameCont());
		String gameManage_cont=b.getGameCont().replace("\n","<br/>");
		
		ModelAndView listM=new ModelAndView();
		List<GameManageVO> gameMemList=this.gameManageService.getGameMemList(gameId);
		List<GameManageVO> scoreList=this.gameManageService.getScoreManageList(gameId);
		//목록-
		
		listM.addObject("gameMemList",gameMemList);//gameMemList 저장
		listM.addObject("b",b);
		listM.addObject("scoreList",scoreList);
		listM.addObject("bcont",gameManage_cont);
		listM.addObject("page",page);//키,값 쌍으로 저장
		if(state.equals("cont")) {//내용보기
			listM.setViewName("gameManage/gameManage_cont");
			return listM;// /WEB-INF/gameManage/
			//gameManage_cont.jsp 뷰페이지로 이동
		}else if(state.equals("edit")) {//수정폼
			listM.setViewName("gameManage/gameManage_edit");
			return listM;
		}else if(state.equals("del")) {//삭제폼
			listM.setViewName("gameManage/gameManage_del");
			return listM;
		}
		return null;
	}//gameManage_cont()
	
	/*점수입력페이지*/
	@RequestMapping("/gameManage_regScorePage")
	public ModelAndView gameManage_regScorePage(
			@RequestParam("no") int gameId,
			@RequestParam("gameRound") String gameRound,
			HttpServletRequest request,
			HttpSession session,
			Model m,
			@ModelAttribute GameManageVO gameManageVO)
					throws Exception{
		
		String memId = (String)session.getAttribute("id");
		gameManageVO.setMemId(memId);
		gameManageVO.setGameId(gameId);
		gameManageVO.setGameRound(gameRound);
		//gameManageVO = gameManageService.gameManageContDetl(gameManageVO);
		//목록-
		ModelAndView listM=new ModelAndView();
		List<GameManageVO> scoreRegList=this.gameManageService.getScoreManageRegList(gameManageVO);
		listM.addObject("scoreRegList",scoreRegList);//scoreList 저장
		listM.addObject("b",gameManageVO);
		listM.setViewName("gameManage/gameManage_regScore");
		return listM;
	}//gameManage_regScorePage()

	
	//점수저장
	@RequestMapping("/gameManage_regScore_ok")
	public ModelAndView gameManage_regScore_ok(
			@ModelAttribute GameManageVO b,
			HttpServletRequest request,
			HttpSession session,
			HttpServletResponse response)
	throws Exception{response.setContentType("text/html;charset=UTF-8");
	
	ModelAndView listM=new ModelAndView();
		b.setGameSeq(Integer.parseInt(b.getGameRound()));
		this.gameManageService.regScoreInsert(b);
		int gameId = b.getGameId();
		
		
		int page=1;
		if(request.getParameter("page") != null) {page=Integer.parseInt(request.getParameter("page"));			
		}
		System.out.println("gameId : " + gameId);
		b.setGameId(gameId);
		String memId = (String)session.getAttribute("id");
		b.setMemId(memId);
		b = gameManageService.gameManageContDetl(b);
		System.out.println("getGameCont : " + b.getGameCont());
		String gameManage_cont=b.getGameCont().replace("\n","<br/>");
		
		List<GameManageVO> gameMemList=this.gameManageService.getGameMemList(gameId);
		List<GameManageVO> scoreList=this.gameManageService.getScoreManageList(gameId);
		//목록-
		
		listM.addObject("gameMemList",gameMemList);//gameMemList 저장
		listM.addObject("b",b);
		listM.addObject("scoreList",scoreList);
		listM.addObject("bcont",gameManage_cont);
		listM.addObject("page",page);//키,값 쌍으로 저장
		
		listM.addObject("gameId",gameId);
		listM.setViewName("gameManage/gameManage_cont");
		return listM;
	}//gameManage_regScore_ok()
	
	/*점수입력페이지*/
	@RequestMapping("/gameManage_attendMem")
	public ModelAndView gameManage_attendMem(
			@RequestParam("no") int gameId,
			HttpServletRequest request,
			HttpSession session,
			Model m,
			@ModelAttribute GameManageVO gameManageVO)
					throws Exception{
		
		String memId = (String)session.getAttribute("id");
		gameManageVO.setMemId(memId);
		gameManageVO.setGameId(gameId);
		//gameManageVO = gameManageService.gameManageContDetl(gameManageVO);
		//목록-
		ModelAndView listM=new ModelAndView();
		List<GameManageVO> gameMemRegList=this.gameManageService.getGameMemRegList(gameManageVO);
		listM.addObject("gameMemRegList",gameMemRegList);//scoreList 저장
		listM.addObject("b",gameManageVO);
		listM.setViewName("gameManage/gameManage_attendMem");
		return listM;
	}//gameManage_attendMem()
	
	//회원추가
	@RequestMapping("/gameManage_attendMem_ok")
	public String gameManage_attendMem_ok(
			@ModelAttribute GameManageVO gameManageVO,
			HttpServletRequest request,
			HttpServletResponse response)
	throws Exception{response.setContentType("text/html;charset=UTF-8");
		
		/*gameManageVO.setGameSeq(Integer.parseInt(gameManageVO.getGameRound()));*/
		this.gameManageService.regGameMemInsert(gameManageVO);

		return "gameManage/gameManage_cont";
	}//gameManage_attendMem_ok()
	
/*	 수정완료 
	@RequestMapping("/gameManage_edit_ok")
	public String gameManage_edit_ok(@ModelAttribute GameManageVO eb,
			HttpServletResponse response,
			HttpServletRequest request) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		//웹브라우저로 출력되는 파일형태와 언어코딩 타입을 설정
		PrintWriter out=response.getWriter();
		
		int page=1;
		if(request.getParameter("page") != null) {
page=Integer.parseInt(request.getParameter("page"));			
		}
GameManageVO db_pwd=
  this.gameManageService.getGameManageCont(eb.getGameManage_no());
//게시물 번호를 기준으로 디비로 부터 비번을 가져옴.
 if(!db_pwd.getGameManage_pwd().equals(eb.getGameManage_pwd())) {
	 out.println("<script>");
	 out.println("alert('비번이 다릅니다!');");
	 out.println("history.back();");
	 out.println("</script>");
 }else {
	 this.gameManageService.editGameManage(eb);//게시물 수정
	 return 
"redirect:/gameManage_cont?no="+eb.getGameManage_no()+
"&page="+page+"&state=cont";//?뒤에 3개의 인자값이 get방식으로
//내용보기로 이동.	 
 }
		return null;
	}*/
	
	//삭제 완료
/*	@RequestMapping("/gameManage_del_ok")
	public String gameManage_del_ok(
			@RequestParam("gameManage_no") int gameManage_no,
			@RequestParam("del_pwd") String del_pwd,
			HttpServletResponse response,
			HttpServletRequest request)
	throws Exception{
response.setContentType("text/html;charset=UTF-8");
PrintWriter out=response.getWriter();
int page=1;
if(request.getParameter("page") != null) {
	page=Integer.parseInt(request.getParameter("page"));
}
GameManageVO db_pwd=this.gameManageService.getGameManageCont(gameManage_no);
//오라클 디비로 부터 비번을 가져옴.
if(!db_pwd.getGameManage_pwd().equals(del_pwd)) {
	out.println("<script>");
	out.println("alert('비번이 다릅니다!');");
	out.println("history.go(-1);");
	out.println("</script>");
}else {
    this.gameManageService.delGameManage(gameManage_no);//게시판 삭제
    return "redirect:/gameManage_list?page="+page;
}
		return null;
	}//gameManage_del_ok()
*/}

