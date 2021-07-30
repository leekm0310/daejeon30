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
	
	//��� �� ��ȸ
	@Override
	@RequestMapping(value = "/board2.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listboard2(HttpServletRequest request, HttpServletResponse reponse) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List board2list = board2Service.listboard2();// ��� �� ���� ��ȸ
		ModelAndView mav = new ModelAndView();
		mav.addObject("board2list", board2list);
		return mav;
	}

	// �α��ΰ� �����ؼ� �Ϸ��� 2_3�� 500������ �������� �������� �װ� �����ϴ°� ����
	// �� �� �̹��� �۾���
	@Override
	@RequestMapping(value = "/board/addNewBoard.do", method ={ RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public ResponseEntity addNewBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> boardMap = new HashMap<String, Object>(); // �� ���� �����
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) { // �۾��� â���� ���۵� �� ������ Map�� key/value�� ����
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			boardMap.put(name, value);
		}

		String imageFileName = upload(multipartRequest);// ���ε��� �̹��� ���� �̸��� ������
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId(); // ����� ȸ�� �����κ��� ȸ�� id�� ������
		// ȸ�� id, �̹��� ���� �̸�,�� ��ȣ�� boardMap�� ����.
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
			message += "alert('������ �߰��߽��ϴ�.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board2.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = "<script>";
			message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ����ּ���');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board2.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;

	}

	// �۾���â
	@RequestMapping(value = "/board/*form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	// �̹��� ���ε�, 1����, ������ �Ϸ��� List ���� ����ϸ� �ȴ�, //�� �ִ¾ֵ��� �ּ����� //�� ������ �ڵ�� ��ȯ��Ű�� �ȴ�
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
			if (mFile.getSize() != 0) { // File Null Check �ϴ� ���
				if (!file.exists()) { //��λ� ������ �������� �������
					if(file.getParentFile().mkdirs()) { 
						file.createNewFile();
					}
					mFile.transferTo(new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));//�ӽ÷� ����� multipartFile�� ���� ���Ϸ� ���ۼ�
					}
				}
			}
			return imageFileName;
			//return fileList;
		}
	
	//�Խñ� ����
	@RequestMapping(value="/board/view_r.do", method = RequestMethod.GET)
	public ModelAndView view_r(@RequestParam("boardNO") int boardNO, //��ȸ�� �� ��ȣ ������

									HttpServletRequest request,
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		board2Service.boardView(boardNO); //��ȸ�� 1 ���� ���
		board2VO = board2Service.view_r(boardNO); //��ȸ�� �� ������ board2VO�� ����
		memberVO = memberService.thisBoard(memberVO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("board",board2VO);
		mav.addObject("member",memberVO);
		return mav;
	}
	
	//����
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
			System.out.println("��Ȯ��1 = "+name +value);
			boardMap.put(name, value);
		}
		
		String imageFileName = upload(multipartRequest);
		System.out.println("��Ȯ��2"+imageFileName);
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
			message += "alert('���� �����߽��ϴ�.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/board/view_r.do?boardNO=" + boardNO +"';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			File srcFile = new File(BOARD_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += "alert('������ �߻��߽��ϴ�. �ٽ� �������ּ���');";
			message += "location.href='"+multipartRequest.getContextPath()+"/board/view_r.do?boardNO=" + boardNO +"';";
			message += "</script>";
			resEnt = new ResponseEntity(message,responseHeaders,HttpStatus.CREATED);
		}
		return resEnt;
		
	}
	
	//�ۻ���
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
			message += "alert('���� �����߽��ϴ�.');";
			message += "location.href='"+request.getContextPath()+"/board2.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('�۾��� ������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���.');";
			message += " location.href='"+request.getContextPath()+"/board2.do';";
			message += " </script>";
		}				
		return resEnt;
	}
	
	@RequestMapping(value = "/board/listPage.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getListPage(HttpServletRequest request, HttpServletResponse reponse,
									@RequestParam("num") int num) throws Exception {
		String viewName = (String) request.getAttribute("viewName");//�� �̸� ��������
		
		 // �Խù� �� ��
		int count = board2Service.count();
		 
		 // �� �������� ����� �Խù�
		int postNum = 10;
		  
		 //�ϴ� ����¡ ��ȣ([�Խù� �� �� �� �� �������� ����� ����])
		int pageNum =
		 (int)Math.ceil((double)count/postNum);
		 
		 //����� �Խù�
		 int displayPost = (num -1) * postNum;
		 
		 //�ѹ��� ǥ���� ����¡ ��ȣ �� 
		 int pageNum_cnt = 10;
		  
		 //ǥ�õǴ� ������ ��ȣ�� ������ ��ȣ
		 int endPageNum = (int)(Math.ceil((double)num /
		 (double)pageNum_cnt)*pageNum_cnt);
		 
		  // ǥ�õǴ� ������ ��ȣ �� ù��° ��ȣ
		 int startPageNum = endPageNum - (pageNum_cnt -1);
		 
		  // ������ ��ȣ ����
		 int endPageNum_tmp = (int)(Math.ceil((double)count /
		  (double)pageNum_cnt));
		  
		  if(endPageNum > endPageNum_tmp) { endPageNum = endPageNum_tmp; }
		  
		  boolean prev = startPageNum == 1? false : true; boolean next = endPageNum *
		  pageNum_cnt >= count? false : true;
		  
		  List<Board2VO> board2list = board2Service.listPage(displayPost, postNum);
		  ModelAndView mav = new ModelAndView(); // ��ü �����
		  mav.addObject("board2list",board2list); // ���� ��ü�� ���޹��� ���� �����ϰ�
		  
		  // ���� �� �� ��ȣ 
		  mav.addObject("startPageNum",startPageNum);
		  mav.addObject("endPageNum",endPageNum);
		 
		  // ���� �� ����
		  mav.addObject("prev",prev); mav.addObject("next",next);
		  
		  // ���� ������ 
		  mav.addObject("select",num);
		  
		  return mav;
		 
	
	}
	

	
	
	
	
	
	}


