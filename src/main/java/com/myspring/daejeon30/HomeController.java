package com.myspring.daejeon30;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.restaurant.service.RestaurantService;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private Bboard2Service bboard2Service;
	@Autowired
	private RestaurantService restaurantService;
	
	//original one
	//@RequestMapping(value={"/","/main.do"}, method=RequestMethod.GET)
	//public String home(Locale locale, Model model) {
	//	return "main";
	//}
	
	//main
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public ModelAndView main1(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List listReview = bboard2Service.reviewList();
		List resAll = restaurantService.allRes();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", resAll);
		mav.addObject("revlist", listReview);
		mav.setViewName("main");
		return mav;
	}
	
	//admin main
	@RequestMapping(value="/adminMain.do", method=RequestMethod.GET)
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("adminMain");
		return mav;
	}
	
	
	//로그인
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	//회원가입
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join(Locale locale, Model model) {
		return "join";
	}
	
	@RequestMapping(value="/res.do", method=RequestMethod.GET)
	public String res(Locale locale, Model model) {
		return "res";
	}
	
	//회원정보수정
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String modify(Locale locale, Model model) {
		return "modify";
	}
	
	//비번찾기
	@RequestMapping(value="/find.do", method=RequestMethod.GET)
	public String find(Locale locale, Model model) {
		return "find";
	}
	
	
	@RequestMapping(value="/login2.do", method=RequestMethod.GET)
	public String login2(Locale locale, Model model) {
		return "login2";
	}
	
	@RequestMapping(value="/rsv2.do", method=RequestMethod.GET)
	public String rsv2(Locale locale, Model model) {
		return "rsv2";
	}
	
	@RequestMapping(value="/rsv3.do", method=RequestMethod.GET)
	public String rsv3(Locale locale, Model model) {
		return "rsv3";
	}
	
	@RequestMapping(value="/result2.do", method=RequestMethod.GET)
	public String result2(Locale locale, Model model) {
		return "result2";
	}
	
	//예약내역조회
	@RequestMapping(value="/trackorder.do", method=RequestMethod.GET)
	public String trackorder(Locale locale, Model model) {
		return "trackorder";
	}
	
	@RequestMapping(value="/res1.do", method=RequestMethod.GET)
	public String res1(Locale locale, Model model) {
		return "res1";
	}
	
	@RequestMapping(value="/result1.do", method=RequestMethod.GET)
	public String result1(Locale locale, Model model) {
		return "result1";
	}
	
	@RequestMapping(value="/modifyRsv.do", method=RequestMethod.GET)
	public String modifyRsv(Locale locale, Model model) {
		return "modifyRsv";
	}
	
	@RequestMapping(value="/rsvnonView.do", method=RequestMethod.GET)
	public String rsvnonView(Locale locale, Model model) {
		return "rsvnonView";
	}
	
	@RequestMapping(value="/adminRes.do", method=RequestMethod.GET)
	public String adminRes(Locale locale, Model model) {
		return "adminRes";
	}
	
	@RequestMapping(value="/addRes.do", method=RequestMethod.GET)
	public String addRes(Locale locale, Model model) {
		return "addRes";
	}
	
	@RequestMapping(value="/viewRes.do", method=RequestMethod.GET)
	public String viewRes(Locale locale, Model model) {
		return "viewRes";
	}
	
	@RequestMapping(value="/like1.do", method=RequestMethod.GET)
	public String like1(Locale locale, Model model) {
		return "like1";
	}
	
	@RequestMapping(value="/adminrsv.do", method=RequestMethod.GET)
	public String adminrsv(Locale locale, Model model) {
		return "adminrsv";
	}
	
	@RequestMapping(value="/modifymem.do", method=RequestMethod.GET)
	public String modifyMem(Locale locale, Model model) {
		return "modifyMem";
	}
	
	
	@RequestMapping(value="/writeform1.do", method=RequestMethod.GET)
	public String writeform1(Locale locale, Model model) {
		return "writeform1";
	}
	
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public String faq(Locale locale, Model model) {
		return "faq";
	}
	
	@RequestMapping(value="/viewOne.do", method=RequestMethod.GET)
	public String viewOne(Locale locale, Model model) {
		return "viewOne";
	}
	
	@RequestMapping(value="/reviewlist.do", method=RequestMethod.GET)
	public String reviewlist(Locale locale, Model model) {
		return "reviewlist";
	}

	//문의게시판 비밀번호 확인
	@RequestMapping(value="/passthro.do", method=RequestMethod.GET)
	public String passthro(Locale locale, Model model) {
		return "passthro";
	}
	
	@RequestMapping(value="/reviewform.do", method=RequestMethod.GET)
	public String reviewform(Locale locale, Model model) {
		return "reviewform";
	}
	
	@RequestMapping(value="/viewReview.do", method=RequestMethod.GET)
	public String viewReview(Locale locale, Model model) {
		return "viewReview";
	}
	
	@RequestMapping(value="/nonrsv.do", method=RequestMethod.GET)
	public String nonrsv(Locale locale, Model model) {
		return "nonrsv";
	}
	


	/**
	 * Simply selects the home view to render by returning its name.
	 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	*/
}
