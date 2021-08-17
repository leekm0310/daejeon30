package com.myspring.daejeon30.restaurant.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.daejeon30.bboard2.service.Bboard2Service;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.paging.PageMaker;
import com.myspring.daejeon30.restaurant.service.RestaurantService;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Controller("restaurantController")
public class RestaurantControllerImpl implements RestaurantController {
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private Bboard2Service bboard2Service;
	
	@Override
	@RequestMapping(value="/res/rlist.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView listRestaurant(HttpServletRequest request, HttpServletResponse response) throws Exception{
		List restaurantList = restaurantService.listRestaurant();
		//List<Map<String, Object>> selectAllImg = restaurantService.allImg();
		
		//List Img = new ArrayList();
		
	//	int imgNum = 0;
	//	for(int i=0; i<selectAllImg.size(); i++) {
	//		System.out.println(selectAllImg.get(i).get("resNum"));
	//		int imgNum3 = (Integer) selectAllImg.get(i).get("resNum");
	//		if(imgNum != imgNum3) {
	//			Img.add(selectAllImg.get(i));
	//			imgNum = (Integer) selectAllImg.get(i).get("resNum");
	//		}
	//	}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", restaurantList);
	//	mav.addObject("allImg", Img);
	//	System.out.print(imgNum);
		mav.setViewName("rlist1");
		return mav;
	}
	
	
	/*@Override원래쓰던 리스트 불러오기
	@RequestMapping(value="/res/rlist1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRes(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List resAll = restaurantService.allRes();
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", resAll);
		mav.setViewName("rlist1");
		return mav;
		
	}*/
	@RequestMapping(value="/res/rlist1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView allRes(Criteria cri, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List resAll = restaurantService.selectResList(cri);
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(restaurantService.countResListTotal());
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", resAll);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("rlist1");
		return mav;
	}
	
	
	
	//@RequestMapping(value="/res/rlist2.do", method= RequestMethod.GET)
	//public ModelAndView viewRestaurant(@RequestParam("resNum") int resNum,
	//		RestaurantVO resVO, HttpServletRequest request, HttpServletResponse response) throws Exception{
	//	resVO = restaurantService.viewRestaurant(resNum);
	//	List<Map<String, Object>> selectRestImg = restaurantService.listImg(resNum);
	//	System.out.print(selectRestImg);
	//	ModelAndView mav = new ModelAndView();
	//	mav.addObject("resDetail",resVO);
	//	mav.addObject("resImg",selectRestImg);
	//	mav.setViewName("rlist2");
	//	return mav;
	//	}
	
	
	@RequestMapping(value="/res/rlist2.do", method= RequestMethod.GET)
	public ModelAndView viewRestaurant(@RequestParam("resNum") int resNum,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> resMap = restaurantService.viewRestaurant(resNum);
		
		RestaurantVO mm = (RestaurantVO) resMap.get("res");
		String mm2=mm.getResName();
		int rnum = mm.getResNum();
		//System.out.print(mm2);
		
		Cookie cookie = new Cookie ("resName", mm2);
	
		cookie.setPath("/");
		cookie.setMaxAge(3600);
		
		response.addCookie(cookie);
	
		//Cookie[] cookies = request.getCookies();
	//	String resName1 = "";
	//	if(cookies != null) {
	//		System.out.println("==========");
	//		for(int i=0; i<cookies.length; i++) {
	//			if(cookies[i].getName().equals("resName")) {
	//				resName1 = cookies[i].getValue();
	//				System.out.print(resName1);
	//			} 
	//		} 
	//	}
	//	request.setAttribute("resName1", resName1);
		
		//RequestDispatcher rd = request.getRequestDispatcher("/rsv3.do");
		//rd.forward(request, response);
		//String me = cookie.getValue();
		//System.out.print(me);
		
		List review = bboard2Service.selectedReview(resNum);
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("resMap", resMap);
		mav.addObject("review", review);
		mav.setViewName("rlist2");
		System.out.print(resMap);
		return mav;
		
		}
	
	
	@RequestMapping(value="/res/rsv3.do", method=RequestMethod.GET)
	public ModelAndView rsv3(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Cookie[] cookies = request.getCookies();
		String resName1 = "";
		if(cookies != null) {
			System.out.println("==========");
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("resName")) {
					resName1 = cookies[i].getValue();
					System.out.print(resName1);
				} 
			} 
		}
		request.setAttribute("resName1", resName1);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rsv3");
		return mav;
	}
	
	
	@RequestMapping(value="/res/rsv2.do", method=RequestMethod.GET)
	public ModelAndView rsv2(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Cookie[] cookies = request.getCookies();
		String resName1 = "";
		if(cookies != null) {
			System.out.println("==========");
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("resName")) {
					resName1 = cookies[i].getValue();
					System.out.print(resName1);
				} 
			} 
		}
		request.setAttribute("resName1", resName1);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rsv2");
		return mav;
	}
	
	@RequestMapping(value="/res/sortRes.do", method=RequestMethod.GET)
	public ModelAndView sortRes(@RequestParam("resSort") int resSort, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		List sorting = restaurantService.sortview(resSort);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", sorting);
		mav.setViewName("rlist1");
		return mav;
	}
	
	@RequestMapping(value="/res/sortFoods.do", method=RequestMethod.GET)
	public ModelAndView sortfoods(@RequestParam("resCategory") String resCategory, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		List sortingf = restaurantService.sortf(resCategory);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", sortingf);
		mav.setViewName("rlist1");
		return mav;
	}
	
	//검색
	@RequestMapping(value="res/searchRes.do", method=RequestMethod.POST)
	public ModelAndView searchRes(String word1, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		String word = "%"+word1+"%";
		System.out.print(word);
		List search = restaurantService.searchRes(word);
		ModelAndView mav = new ModelAndView();
		mav.addObject("resList", search);
		mav.setViewName("rlist1");
		return mav;
		
	}
}