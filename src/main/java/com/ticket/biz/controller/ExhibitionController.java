package com.ticket.biz.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.exhibition.ExhibitionService;
import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;

@Controller
@SessionAttributes("exhibition")
public class ExhibitionController {

	
	@Autowired
	private ExhibitionService exhibitionService;
	
	
	// 전시 필터
//	@ModelAttribute("exSearchConditionMap")
//	public Map<String, String> exFilterConditionMap(){
//		Map<String, String> exFilterMap = new HashMap<String, String>();
//		exFilterMap.put("전시시작일자 내림차순", "EXH_ST_DATE");
//		exFilterMap.put("전시시작일자 오름차순", "EXH_ST_DATE");
//		exFilterMap.put("전시종료일자", "EXH_END_DATE");
//		exFilterMap.put("전시삭제여부", "EXH_CANCELL");
//		return exFilterMap;
//	}
	
	// 전시 검색
	@ModelAttribute("exSearchConditionMap")
	public Map<String, String> exSearchConditionMap(){
		Map<String, String> exConditionMap = new HashMap<String, String>();
		exConditionMap.put("전시명", "EXH_TITLE");
//		exConditionMap.put("장소", "EXH_HALL");
	return exConditionMap;
	}

	// 전시 등록 이동
		@RequestMapping("/insertmoveExhibition")
//		public String insertmoveExhibition(ExhibitionVO vo) {
			public String insertmoveExhibition(ExhibitionVO vo, Model model) {
			System.out.println("상세보기 갔다가 다시 등록하기 누름"+vo.toString());
//			model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
			return "admin/ExhibitionInsert";
		}
	
	// 전시 등록
		@RequestMapping(value="/insertExhibition")
		public String requestupload2(MultipartHttpServletRequest mRequest, ExhibitionVO vo, Model model) {
		
		MultipartFile uploadFile_banne = vo.getUploadFile_banne();
		String fileName_banne = uploadFile_banne.getOriginalFilename();
		
		MultipartFile uploadFile_thumb = vo.getUploadFile_thumb();
		String fileName_thumb = uploadFile_thumb.getOriginalFilename();
		
		String realPath = "C:/swork/tickets/src/main/webapp/images/";
//		String realPath = "D:/swork/tickets/src/main/webapp/images/";
		String fileName="";
		
		List<MultipartFile> fileList = mRequest.getFiles("uploadFile");
		
		if (!uploadFile_banne.isEmpty()) {
			vo.setExh_banne(fileName_banne);
			try {
				uploadFile_banne.transferTo(new File(realPath + fileName_banne));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if (!uploadFile_thumb.isEmpty()) {
			vo.setExh_thumbnail(fileName_thumb);
			try {
				uploadFile_thumb.transferTo(new File(realPath + fileName_thumb));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		for (MultipartFile mf : fileList) {
			fileName +="/"+ mf.getOriginalFilename(); // 원본 파일 명
//			long fileSize = mf.getSize(); // 파일 사이즈
			String fileSaveName=mf.getOriginalFilename();
			String safeFile = realPath + fileSaveName;
			
			vo.setExh_img(fileName);//파일명 담음
			try {
				mf.transferTo(new File(safeFile));//파일 저장?
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		int maxExh_no = exhibitionService.getMaxExhibition(vo);
		exhibitionService.insertExhibition(vo);
//		model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
		System.out.println("최대 번호 : "+maxExh_no);
		int maxEXNPlus = maxExh_no+1;
		System.out.println("최대 번호 : "+maxEXNPlus);
//		return "redirect:getExhibitionList";
//		return "admin/ExhibitionDetail";
		return "redirect:getExhibition?exh_no="+maxEXNPlus;
	}
		
	// 전시 승인
	@RequestMapping("/approvalExhibition")
	public String approvalExhibition(@ModelAttribute("exhibition") ExhibitionVO vo, HttpSession session) {
		exhibitionService.approvalExhibition(vo);
		System.out.println("전시 승인 서비스 실행");
		System.out.println("exh_no="+vo.getExh_no());
		return "redirect:getExhibition?exh_no="+vo.getExh_no();
	}
	
	// 전시 수정 이동
	@RequestMapping("/modifymoveExhibition")
//	public String insertmoveExhibition(ExhibitionVO vo) {
//		public String modifymoveExhibition(ExhibitionVO vo, Model model, HttpServletRequest request) {
		public String modifymoveExhibition(ExhibitionVO vo, Model model) {
//		String page= request.getParameter("page");
		model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
//		model.addAttribute("page",page);
//		System.out.println("수정이동 : "+page);
		System.out.println("수정이동 : "+vo.getExh_no());
		
		return "admin/ExhibitionModify";
	}
	
	// 전시 수정
	@RequestMapping("/updateExhibition")
	public String updateExhibition(@ModelAttribute("exhibition") ExhibitionVO vo, HttpSession session) {
		
		exhibitionService.updateExhibition(vo);
		System.out.println("수정이동 : "+vo.getExh_no());
//		return "redirect:getExhibitionList";
		return "redirect:getExhibition";
	}
	
	// 전시 삭제
	@RequestMapping("/deleteExhibition")
	public String deleteExhibition(ExhibitionVO vo, HttpSession session,HttpServletRequest request) {
//		String realPath = "D:/swork/tickets/src/main/webapp/images/";
		String realPath = "C:/swork/tickets/src/main/webapp/images/";
		vo = exhibitionService.getExhibition(vo);
		if (vo.getExh_img() != null || vo.getExh_thumbnail() != null ||  vo.getExh_banne() != null ) {
			String[] imgArr = vo.getExh_img().split("/");
			for(int i=1; i < imgArr.length; i++) {
				String ex_img=imgArr[i];
				File f = new File(realPath + ex_img);
				f.delete();
			}
			File t = new File(realPath + vo.getExh_thumbnail());
			File b = new File(realPath + vo.getExh_banne());
			t.delete();
			b.delete();
		}
		String page= request.getParameter("page");
		exhibitionService.deleteExhibition(vo);
		System.out.println("page :"+page);
		return "redirect:getExhibitionList?nowPageBtn="+page;
	}

	// 전시 상세 조회
	@RequestMapping("/getExhibition")
	public String getExhibition(ExhibitionVO vo, Model model, HttpServletRequest request) {
		String page= request.getParameter("page");
		model.addAttribute("page",page);
		System.out.println("page 상세 : "+page);
		model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
		return "admin/ExhibitionDetail";
	}
	
	// 전시 목록 조회
	@RequestMapping("/getExhibitionList")
	
	public String getExhibitionList(ExhibitionVO vo, String nowPageBtn, Model model) {
		System.out.println("컨트롤");
		
		
		//총 목록 수
				int totalPageCnt = exhibitionService.totalExhibitionListCnt(vo);
				//현재 페이지 설정
				int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
				System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
				//한페이지당 보여줄 목록 수
				int onePageCnt = 10;
				//한 번에 보여질 버튼 수
				int oneBtnCnt = 5;

				PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
				vo.setOffset(pvo.getOffset());

				model.addAttribute("paging", pvo);
				model.addAttribute("exhibitionList", exhibitionService.getExhibitionList(vo));
				
				System.out.println("컨트롤러 완료");
				return "admin/ExhibitionList";
	}
	
	@Autowired
	GoodService goodService;
	// 유저 전시 상세 조회
		@RequestMapping("/getUserExhibition")
		public String getUserExhibition(ExhibitionVO vo, Model model,HttpSession session,GoodVO gvo) {
	
		
			String id=(String)session.getAttribute("mb_Id");
			
			gvo.setExh_no(vo.getExh_no());
			gvo.setMb_id(id);
	
				
				model.addAttribute("good_check",goodService.getGoodYN(gvo));
			
			model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
			return "exhibition/UserExhibitionDetail";
		}
	
	// 유저 전시 목록 조회
		@RequestMapping("/getUserExhibitionList")
		public String getUserExhibitionList(ExhibitionVO vo, String nowPageBtn, Model model) {
			//총 목록 수
					int totalPageCnt = exhibitionService.totalUSerExhibitionListCnt(vo);
					//현재 페이지 설정
					int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
					System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
					//한페이지당 보여줄 목록 수
					int onePageCnt = 10;
					//한 번에 보여질 버튼 수
					int oneBtnCnt = 5;

					PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
					vo.setOffset(pvo.getOffset());
					
					model.addAttribute("paging", pvo);
					model.addAttribute("UserExhibitionList", exhibitionService.getUserExhibitionList(vo));
					
					return "exhibition/getUserExhibitionList";
		}
}
