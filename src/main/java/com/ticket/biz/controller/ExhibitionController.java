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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.exhibition.ExhibitionService;
import com.ticket.biz.exhibition.ExhibitionVO;
import com.ticket.biz.good.GoodService;
import com.ticket.biz.good.GoodVO;
import com.ticket.biz.review.ReviewService;
import com.ticket.biz.review.ReviewVO;

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

	
	// 전시 등록 이동
		@RequestMapping("/insertmoveExhibition")
			public String insertmoveExhibition(ExhibitionVO vo, Model model) {
			System.out.println("상세보기 갔다가 다시 등록하기 누름"+vo.toString());
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
		int autoExh_no = exhibitionService.getMaxExhibition(vo);
		exhibitionService.insertExhibition(vo);
		System.out.println("최대 번호 : "+autoExh_no);
		return "redirect:getExhibition?exh_no="+autoExh_no;
	}
		
	// 전시 승인
	@RequestMapping("/approvalExhibition")
	public String approvalExhibition(@ModelAttribute("exhibition") ExhibitionVO vo, HttpSession session) {
		exhibitionService.approvalExhibition(vo);
		return "redirect:getExhibition?exh_no="+vo.getExh_no();
	}
	
	// 전시 수정 이동
	@RequestMapping("/modifymoveExhibition")
		public String modifymoveExhibition(ExhibitionVO vo, Model model) {
		model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
		System.out.println("수정이동 : "+vo.getExh_no());
		
		return "admin/ExhibitionModify";
	}
	
	// 전시 수정
	@RequestMapping("/updateExhibition")
	public String updateExhibition(@ModelAttribute("exhibition") ExhibitionVO vo, HttpSession session) {
		
		exhibitionService.updateExhibition(vo);
		System.out.println("수정이동 : "+vo.getExh_no());
		return "redirect:getExhibition";
	}
	
	// 전시 삭제
	@RequestMapping("/deleteExhibition")
	public String deleteExhibition(ExhibitionVO vo, HttpSession session,HttpServletRequest request) {
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
	ReviewService reviewService;
	@Autowired
	GoodService goodService;
	// 유저 전시 상세 조회
		@RequestMapping("/getUserExhibition")
		public String getUserExhibition(ExhibitionVO vo, Model model,HttpSession session,GoodVO gvo,ReviewVO rvo,String nowPageBtn,HttpServletRequest request) {
			int exh_no=Integer.parseInt(request.getParameter("exh_no")); 
			rvo.setReview_bno(exh_no);
//			System.out.println("전시회번호1!!!!!"+rvo.exh_no);
			int total = reviewService.getTotal(rvo);
			int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
			System.out.println("totalPageCnt: "+total +", nowPage: "+nowPage);

			//한페이지당 보여줄 목록 수
			int onePageCnt = 5;

			//한 번에 보여질 버튼 수
			int oneBtnCnt = 5;
			
			
			System.out.println("페이징처리전 ");
			PagingVO pvo = new PagingVO(total, onePageCnt, nowPage, oneBtnCnt);
			vo.setOffset(pvo.getOffset());

			System.out.println("nowpage 찍혀라"+pvo.getNowPageBtn());
			System.out.println("마지막 버튼!!!!"+pvo.getEndBtn());
			List<ReviewVO> list = reviewService.getReviewList(rvo);
			
			ModelAndView view = new ModelAndView();
			
			System.out.println("오프셋출력!!!!!"+vo.getOffset());
			Map<String, Object> map = new HashMap<>();
			model.addAttribute("reviewList",list);
			model.addAttribute("paging", pvo);
			map.put("list", list);
			map.put("total", total);
			
			view.setViewName("reviewwrite");
			System.out.println(rvo.getReview_bno());
			System.out.println("review list 가져오는 controller 다 탔음");
			
			
		
			String id=(String)session.getAttribute("mb_Id");
			
			gvo.setExh_no(vo.getExh_no());
			gvo.setMb_id(id);
	
				
				model.addAttribute("good_check",goodService.getGoodYN(gvo));
			
			model.addAttribute("exhibition", exhibitionService.getExhibition(vo));
			return "exhibition/UserExhibitionDetail";
		}
	
	// 유저 전시 목록 조회
		@RequestMapping("/getUserExhibitionList")
		public String getUserExhibitionList(ExhibitionVO vo, String nowPageBtn, Model model, HttpSession session) {
			//총 목록 수
			
					int totalPageCnt = exhibitionService.totalUserExhibitionListCnt(vo);
					//현재 페이지 설정
					int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
					System.out.println("totaluserPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
					//한페이지당 보여줄 목록 수
					int onePageCnt = 16;
					//한 번에 보여질 버튼 수
					int oneBtnCnt = 5;

					PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
					vo.setOffset(pvo.getOffset());
					
					model.addAttribute("paging", pvo);
					model.addAttribute("UserExhibitionList", exhibitionService.getUserExhibitionList(vo));
					System.out.println("검색어-"+vo.getESearchKeyword());
					
					return "exhibition/getUserExhibitionList";
		}
		// 유저 전시 목록 조회
				@RequestMapping("/local")
				public String getLocalList(ExhibitionVO vo, String nowPageBtn, Model model,HttpServletRequest request) {
					System.out.println("전시컨트롤러");
					//총 목록 수
					 String[] loc = {"서울", "경기/인천", "충청/강원","대구/경북","부산/경남","광주/전라","제주"}; 
				   		String a="서울";	
				   		if(request.getParameter("exh_local_name")!=null) {	
				   		a=request.getParameter("exh_local_name");
				   		}
			        	vo.setExh_local_name(a);
						int totalPageCnt = exhibitionService.totalUserExhibitionListCnt(vo);
						//현재 페이지 설정
						int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
						System.out.println("totaluserPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
						//한페이지당 보여줄 목록 수
						int onePageCnt = 16;
						//한 번에 보여질 버튼 수
						int oneBtnCnt = 5;

						PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
						vo.setOffset(pvo.getOffset());
						model.addAttribute("paging", pvo);
							model.addAttribute("UserExhibitionList", exhibitionService.getUserExhibitionList(vo));
							model.addAttribute("loc",loc);
							return "exhibition/local";
				}
		
		// 지역 목록 조회
		@ResponseBody
		@RequestMapping("/local_search")
		public HashMap<String, Object> getLocalSearchList(ExhibitionVO vo, String nowPageBtn, Model model,HttpServletRequest request) {
			//총 목록 수
			   String[] loc = {"서울", "경기/인천", "충청/강원","대구/경북","부산/경남","광주/전라","제주"}; 
			   		String a="서울";	
			   		if(request.getParameter("exh_local_name")!=null) {	
			   		a=request.getParameter("exh_local_name");
			   		}
		        	vo.setExh_local_name(a);
					int totalPageCnt = exhibitionService.totalUserExhibitionListCnt(vo);
					//현재 페이지 설정
					int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
					System.out.println("totaluserPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
					//한페이지당 보여줄 목록 수
					int onePageCnt = 16;
					//한 번에 보여질 버튼 수
					int oneBtnCnt = 5;

					PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
					vo.setOffset(pvo.getOffset());
					model.addAttribute("paging", pvo);
					
					ModelAndView view = new ModelAndView();
					Map<String, Object> map = new HashMap<>();
					
//					model.addAttribute("UserExhibitionList", exhibitionService.getUserExhibitionList(vo));
//					model.addAttribute("loc",loc);
//					model.addAttribute("paging", pvo);
					map.put("UserExhibitionList",exhibitionService.getUserExhibitionList(vo));
					map.put("paging", pvo);
					map.put("loc", loc);
					view.setViewName("local");
					return (HashMap<String, Object>) map;
		}
}
