
package com.ticket.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.common.PagingVO;
import com.ticket.biz.one.OneService;
import com.ticket.biz.one.OneVO;

@Controller
@SessionAttributes("one")
public class OneController {

	@Autowired
	private OneService oneService;
	//검색
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}

	// 글쓰기 이동 컨트롤러
	@RequestMapping("/goWrite")
	public String goOne(OneVO vo, Model model) {
		return "redirect:write.jsp";
	}

	//글 등록
	@RequestMapping("/insertOne")

	public String insertOne(OneVO vo ,Model model , HttpSession session) {
//		if(vo.isOne_secret()==true & vo.getOne_writer()== session.getAttribute("mb_id"))
		System.out.println("확인" + vo.toString());

		oneService.insertOne(vo);
		return "redirect:getOneList";

	}

	//"uploadFile" 추가시
//	@PostMapping(value = "/insertOne")
////	public String insertOne(MultipartHttpServletRequest request, OneVO vo) throws IllegalStateException, IOException {
//	public String insertOne(OneVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
//		//realPath 추가
////	    String realPath = request.getSession().getServletContext().getRealPath("/img/");
//		String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
//	    String fileName = uplodFile.getOriginalFilename();
//		if(!uplodFile.isEmpty()) {
//			vo.setFilename(fileName);
//			uplodFile.transferTo(new File(realPath+fileName));
//		}
//		oneService.insertOne(vo);
//		return "getOneList";
//	}

	// 글 수정
	@RequestMapping("/updateOne")
	public String updateOne(@ModelAttribute("one") OneVO vo, HttpSession session , HttpServletResponse response) throws IOException {
		System.out.println("글 수정 기능 전");
		
		String writer=vo.getOne_writer();
		if( vo.getOne_writer().equals(session.getAttribute("mb_Id").toString()) ){
				
			
			oneService.updateOne(vo);
			PrintWriter script;
			
			
			
			
			
			
			return "redirect:getOneList";
		}else {
			
			try {
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('작성자와 아이디가 일치하지 않습니다.');");
				script.println("location.href = 'getOne'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "one/getOne?error=1";
		}

	}

	// 글 삭제
	@RequestMapping("/deleteOne")
	public String deleteOne(OneVO vo, HttpSession session , HttpServletResponse response) {
		System.out.println("delteOne"+vo.getOne_writer());
		System.out.println("deleteOne 기능 처리 전");
	
		if( vo.getOne_writer().equals(session.getAttribute("mb_Id").toString())){
					
			
			
			PrintWriter script;
			
			oneService.deleteOne(vo);
			
			return "redirect:getOneList";
		}else {
			
			try {
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('작성자와 아이디가 일치하지 않습니다.');");
				script.println("location.href = 'getOne'");
				script.println("</script>");
				script.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return "one/getOne?error=1";
		}
		
	}

	// 글 상세 조회
	@RequestMapping("/getOne")
	public String getOne(OneVO vo, Model model) {
		System.out.println("글상세조회");
		model.addAttribute("one", oneService.getOne(vo));
		System.out.println("글상세조회 수행");
//		model.addAttribute("oneList", oneService.getOneList(vo));
		return "one/getOne";
	}

	// 글 목록
	@RequestMapping("/getOneList")
	public String getOneListPost(OneVO vo, String nowPageBtn, Model model) {
		System.out.println("글 목록 검색 처리gg");
		   String searchKeyword =vo.getSearchKeyword();
		      model.addAttribute("searchKeyword",searchKeyword);
		//총 목록 수
		int totalPageCnt = oneService.totalOneListCnt(vo);
		System.out.println("totaloneListCnt 수행 완료");
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
		System.out.println("modelAttribute getoneList");
		model.addAttribute("oneList", oneService.getOneList(vo));
		List<OneVO> onelist =oneService.getOneList(vo);
		System.out.println("modelAttribute getOneList 기능 실행 후 ");
		return "one/oneList";
	}
	
	
	
	//관리자가 1:1문의 댓글 달아주기
	@RequestMapping("/oneAnswer")
	public String oneAnswer(OneVO vo, Model model) {
		System.out.println("관리자가 1:1문의 글 답변 해주는 controller 타기 ");
		oneService.doAnswer(vo);
		
		System.out.println("1:1문의 답변 기능 수행 컨트롤러 끝");
//		System.out.println("one_answer"+vo.getOne_answer());
//		model.addAttribute("answer",vo);
		return "forward:getOne";
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
