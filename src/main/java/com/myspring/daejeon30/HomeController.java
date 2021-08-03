package com.myspring.daejeon30;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value={"/","/main.do"}, method=RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join(Locale locale, Model model) {
		return "join";
	}
	
	@RequestMapping(value="/res.do", method=RequestMethod.GET)
	public String res(Locale locale, Model model) {
		return "res";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public String modify(Locale locale, Model model) {
		return "modify";
	}
	
	@RequestMapping(value="/find.do", method=RequestMethod.GET)
	public String find(Locale locale, Model model) {
		return "find";
	}
	
	@RequestMapping(value="/rlist1.do", method=RequestMethod.GET)
	public String rlist1(Locale locale, Model model) {
		return "rlist1";	
	}
	
	@RequestMapping(value="/rlist2.do", method=RequestMethod.GET)
	public String rlist2(Locale locale, Model model) {
		return "rlist2";
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
	
	@RequestMapping(value="/listMem.do", method=RequestMethod.GET)
	public String listMem(Locale locale, Model model) {
		return "listMem";
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
	
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
	public String notice(Locale locale, Model model) {
		return "notice";
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
	
	@RequestMapping(value="/qna.do", method=RequestMethod.GET)
	public String qna(Locale locale, Model model) {
		return "qna";
	}
	
	@RequestMapping(value="/writeformQ.do", method=RequestMethod.GET)
	public String writeformQ(Locale locale, Model model) {
		return "writeformQ";
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
