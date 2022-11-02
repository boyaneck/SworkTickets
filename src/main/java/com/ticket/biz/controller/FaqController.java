package com.ticket.biz.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.faq.FaqService;
import com.ticket.biz.faq.FaqVO;
import com.ticket.biz.common.PagingVO;

@Controller
@SessionAttributes("faq")
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	//검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}
	
	//이동 컨트롤러
//	@RequestMapping("/goWrite")
//	public String goFaq(FaqVO vo , Model model) {
////		model.addAttribute("boardList", faqService.getFaqList(vo));
//		return "redirect:write.jsp";
//	}
	
	//글 등록
	
//	@RequestMapping("/insertFaq")
//	
//	public String insertFaq(FaqVO vo ,Model model , HttpSession session) {
////		if(vo.isNoti_secret()==true & vo.getNoti_writer()== session.getAttribute("mb_id"))
//
//		faqService.insertFaq(vo);	
//		return "redirect:faqBoardList";
//		
//	}

	//"uploadFile" 추가시 
//	@PostMapping(value = "/insertFaq")
////	public String insertFaq(MultipartHttpServletRequest request, FaqVO vo) throws IllegalStateException, IOException {
//	public String insertFaq(FaqVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
//		//realPath 추가
////	    String realPath = request.getSession().getServletContext().getRealPath("/img/");
//		String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
//	    String fileName = uplodFile.getOriginalFilename();
//		if(!uplodFile.isEmpty()) {
//			vo.setFilename(fileName);
//			uplodFile.transferTo(new File(realPath+fileName));
//		}
//		faqService.insertFaq(vo);
//		return "getFaqList";
//	}

	// 글 수정
//	@RequestMapping("/updateFaq")
//	public String updateFaq(@ModelAttribute("board") FaqVO vo, HttpSession session) {
//		System.out.println("글 수정 기능 전");
//		System.out.println("vo 객체" +vo.toString());
////		if(vo.getNoti_writer().equals(session.getAttribute("userId").toString()) ){
////			 
//			faqService.updateFaq(vo);
//			return "redirect:getFaqList";
////		}else {
////			return "getFaq?error=1";
////		}
//		
//	}

	// 글 삭제
//	@RequestMapping("/deleteFaq")
//	public String deleteFaq(FaqVO vo, HttpSession session) {
//		System.out.println("deleteFaq 기능 처리 전");
//		int val=0;
//		System.out.println("val " +val);
//		String realPath = "c:/swork/ticket/src/main/webapp/img/" ;
////		vo = faqService.getFaq(vo);
////		if( vo.getNoti_writer().equals(session.getAttribute("userId").toString()) ) {
////			if(vo.getFilename()!=null) {
////				System.out.println("파일삭제: "+realPath + vo.getFilename());
////				File f = new File(realPath + vo.getFilename());		
////				f.delete();
////			}
//			
//			faqService.deleteFaq(vo);
//			return "redirect:getFaqList";
////		}else {
////			return "getFaq?error=1";
////		}
//	}

	// 글 상세 조회
//	@RequestMapping("/getFaq")
//	public String getFaq(FaqVO vo, Model model) {
//		System.out.println("글상세조회");
//		model.addAttribute("board", faqService.getFaq(vo));
//		System.out.println("글상세조회 수행");
//		return "board/getFaq";
//	}

	// 글 목록
	@RequestMapping("/getFaqList")
	public String getFaqListPost(FaqVO vo, String nowPageBtn, Model model) {
		System.out.println("글 목록 검색 처리gg");
		
		//총 목록 수 
		int totalPageCnt = faqService.totalFaqListCnt(vo);
		System.out.println("totalFaqListCnt 수행 완료");
		//현재 페이지 설정 
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
		
		//한페이지당 보여줄 목록 수
		int onePageCnt = 10;
		
		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		System.out.println("페이징처리전 ");
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());
		
		
		model.addAttribute("paging", pvo);
		System.out.println("modelAttribute getFaqList");
		model.addAttribute("faqList", faqService.getFaqList(vo));
		List<FaqVO> faqlist =faqService.getFaqList(vo);
		System.out.println("modelAttribute getFaqList 기능 실행 후 ");
		return "faq/faqList";
	}
	
	//파일다운로드
//	@GetMapping(value="/download")
//    public void fileDownLoad(@RequestParam(value="filename", required=false) String filename, 
//    		HttpServletRequest request, HttpServletResponse response) throws IOException {
//		System.out.println("파일 다운로드");
//		if (!(filename == null || filename.equals(""))) {
//	        //요청파일 정보 불러오기
//	        String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
////		    String realPath = request.getSession().getServletContext().getRealPath("/img/");
//	        File file = new File(realPath+filename);        
//	
//			//한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다
//			String fn = new String(file.getName().getBytes(), "iso_8859_1");
//			
//			//ContentType설정
//			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
//			response.setHeader("Content-Disposition", "attachment; filename=\""+ fn + "\"");
//			response.setContentLength(bytes.length);
//	//			response.setContentType("image/jpeg");	        
//			response.getOutputStream().write(bytes);
//	        response.getOutputStream().flush();
//	        response.getOutputStream().close();
//        }
//    }
}
