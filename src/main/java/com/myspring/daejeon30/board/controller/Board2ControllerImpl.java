package com.myspring.daejeon30.board.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.daejeon30.board.service.Board2Service;
import com.myspring.daejeon30.board.vo.Board2VO;
import com.myspring.daejeon30.member.service.MemberService;
import com.myspring.daejeon30.member.vo.MemberVO;

import jdk.internal.org.jline.utils.Log;

@Controller("boardController")
public class Board2ControllerImpl implements Board2Controller {
	private static final String BOARD_IMAGE_REPO = "C:\\board\\board_image";
	@Autowired
	Board2Service board2Service;
	
	@Autowired
	MemberService memberService;

	@Autowired
	Board2VO board2VO;
	
	@Autowired
	MemberVO memberVO;
	
	//모든 글 조회
	@Override
	@RequestMapping(value = "/board2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listboard2(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List board2list = board2Service.listboard2();// 모든 글 정보 조회
		ModelAndView mav = new ModelAndView();
		mav.addObject("board2list", board2list);
		return mav;
	}

	// 로그인과 연계해서 하려면 2_3의 500페이지 언저리를 뒤져보면 그거 세팅하는거 나옴
	// 한 개 이미지 글쓰기
	@Override
	@RequestMapping(value = "/board/addNewBoard.do", method ={ RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity addNewBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> boardMap = new HashMap<String, Object>(); // 글 정보 저장용
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) { // 글쓰기 창에서 전송된 글 정보를 Map에 key/value로 저장
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			boardMap.put(name, value);
		}

		String imageFileName = upload(multipartRequest);// 업로드한 이미지 파일 이름을 가져옴
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId(); // 저장된 회원 정보로부터 회원 id를 가져옴
		// 회원 id, 이미지 파일 이름,글 번호를 boardMap에 저장.
		boardMap.put("id", id);
		boardMap.put("imageFileName", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int boardNO = board2Service.addNewBoard(boardMap);
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(BOARD_IMAGE_REPO + "\\" + boardNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += "alert('새글을 추가했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board2.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board2.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// 글쓰기창
	@RequestMapping(value = "/board/*form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// 이미지 업로드, 1개만, 여러개 하려면 List 형을 사용하면 된다, //만 있는애들을 주석으로 //에 쓰여진 코드로 전환시키면 된다
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Map<String, String> boardMap = new HashMap<String, String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			//String originalFileName=mFile.getOriginalFilename();
			//fileList.add(originalFileName);
			imageFileName = mFile.getOriginalFilename();//
			File file = new File(BOARD_IMAGE_REPO + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check 하는 기능
				if (!file.exists()) { //경로상에 파일이 존재하지 않을경우
					if(file.getParentFile().mkdirs()) { 
						file.createNewFile();
					}
					mFile.transferTo(new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));//임시로 저장된 multipartFile을 실제 파일로 전송송
					}
				}
			}
			return imageFileName;
			//return fileList;
		}
	
	//게시글 보기
	@RequestMapping(value="/board/view_r.do", method = RequestMethod.GET)
	public ModelAndView view_r(@RequestParam("boardNO") int boardNO, //조회할 글 번호 가져옴

									HttpServletRequest request,
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		board2Service.boardView(boardNO); //조회수 1 증가 기능
		board2VO = board2Service.view_r(boardNO); //조회한 글 정보를 board2VO에 설정
		memberVO = memberService.thisBoard(memberVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("board",board2VO);
		mav.addObject("member",memberVO);
		return mav;
	}
	
	//수정
	@RequestMapping(value="/modBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modBoard(MultipartHttpServletRequest multipartRequest,
									HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> boardMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			String value = multipartRequest.getParameter(name);
			System.out.println("값확인1 = "+name +value);
			boardMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);
		System.out.println("값확인2"+imageFileName);
		boardMap.put("imageFileName",imageFileName);
		
		
		String boardNO = (String)boardMap.get("boardNO");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			board2Service.modBoard(boardMap);
			if(imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(BOARD_IMAGE_REPO + "\\" + boardNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String)boardMap.get("originalFileName");
				File oldFile = new File(BOARD_IMAGE_REPO + "\\" + boardNO + "\\" + originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += "alert('글을 수정했습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/view_r.do?boardNO=" + boardNO +"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			File srcFile = new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 수정해주세요');";
			message += "location.href='"+multipartRequest.getContextPath()+"/board/view_r.do?boardNO=" + boardNO +"';";
			message += "</script>";
			resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}
		return resEnt;
		
	}
	
	//글삭제
	@Override
	@RequestMapping(value="/board/removeBoard.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeBoard(@RequestParam("boardNO") int boardNO,
									HttpServletRequest request,
									HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			board2Service.removeBoard(boardNO);
			File destDir = new File (BOARD_IMAGE_REPO + "\\" + boardNO);
			FileUtils.deleteDirectory(destDir);
			
			message = "<script>";
			message += "alert('글을 삭제했습니다.');";
			message += "location.href='"+request.getContextPath()+"/board2.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다. 다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/board2.do';";
			message += " </script>";
		}				
		return resEnt;
	}
	
	@RequestMapping(value = "/board/listPage.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getListPage(HttpServletRequest request, HttpServletResponse reponse,
									@RequestParam("num") int num) throws Exception {
		String viewName = (String) request.getAttribute("viewName");//뷰 이름 가져오고
		
		 // 게시물 총 수
		int count = board2Service.count();
		 
		 // 한 페이지에 출력할 게시물
		int postNum = 10;
		  
		 //하단 페이징 번호([게시물 총 수 ÷ 한 페이지에 출력할 갯수])
		int pageNum =
		 (int)Math.ceil((double)count/postNum);
		 
		 //출력할 게시물
		 int displayPost = (num -1) * postNum;
		 
		 //한번에 표시할 페이징 번호 수 
		 int pageNum_cnt = 10;
		  
		 //표시되는 페이지 번호중 마지막 번호
		 int endPageNum = (int)(Math.ceil((double)num /
		 (double)pageNum_cnt)*pageNum_cnt);
		 
		  // 표시되는 페이지 번호 중 첫번째 번호
		 int startPageNum = endPageNum - (pageNum_cnt -1);
		 
		  // 마지막 번호 재계산
		 int endPageNum_tmp = (int)(Math.ceil((double)count /
		  (double)pageNum_cnt));
		  
		  if(endPageNum > endPageNum_tmp) { endPageNum = endPageNum_tmp; }
		  
		  boolean prev = startPageNum == 1? false : true; boolean next = endPageNum *
		  pageNum_cnt >= count? false : true;
		  
		  List<Board2VO> board2list = board2Service.listPage(displayPost, postNum);
		  ModelAndView mav = new ModelAndView(); // 객체 만들고
		  mav.addObject("board2list",board2list); // 만든 객체에 전달받은 정보 저장하고
		  
		  // 시작 및 끝 번호 
		  mav.addObject("startPageNum",startPageNum);
		  mav.addObject("endPageNum",endPageNum);
		 
		  // 이전 및 다음
		  mav.addObject("prev",prev); mav.addObject("next",next);
		  
		  // 현재 페이지 
		  mav.addObject("select",num);
		  
		  return mav;
		 
	
	}
	

	
	
	
	
	
	}


