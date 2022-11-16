
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
		
		String writer=vo.getOne_writer();
		if( vo.getOne_writer().equals(session.getAttribute("mb_Id").toString()) ){
				
			
			
			PrintWriter script;
			
			
			try {
				PrintWriter Script1;
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter script1 = response.getWriter();
				script1.println("<script>");
				script1.println("alert('수정되었습니다.');");
				script1.println("location.href = 'getOneList'");
				script1.println("</script>");
				script1.close();
				oneService.updateOne(vo);
				
			} 
			catch (IOException e){
				e.printStackTrace();
			}
			
			
			
			
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
		model.addAttribute("one", oneService.getOne(vo));
		return "one/getOne";
	}

	// 글 목록
	@RequestMapping("/getOneList")
	public String getOneListPost(OneVO vo, String nowPageBtn, Model model) {
		   String searchKeyword =vo.getSearchKeyword();
		      model.addAttribute("searchKeyword",searchKeyword);
		//총 목록 수
		int totalPageCnt = oneService.totalOneListCnt(vo);
		//현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);

		//한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());


		model.addAttribute("paging", pvo);
		model.addAttribute("oneList", oneService.getOneList(vo));
		List<OneVO> onelist =oneService.getOneList(vo);
		return "one/oneList";
	}
	
	
	
	//관리자가 1:1문의 댓글 달아주기
	@RequestMapping("/oneAnswer")
	public String oneAnswer(OneVO vo, Model model) {
		oneService.doAnswer(vo);
		
//		model.addAttribute("answer",vo);
		return "forward:getOne";
	}
	

	//파일다운로드
//	@GetMapping(value="/download")
//    public void fileDownLoad(@RequestParam(value="filename", required=false) String filename,
//    		HttpServletRequest request, HttpServletResponse response) throws IOException {
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
