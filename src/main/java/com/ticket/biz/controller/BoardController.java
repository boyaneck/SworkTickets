package com.ticket.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ticket.biz.board.BoardService;
import com.ticket.biz.board.BoardVO;
import com.ticket.biz.common.PagingVO;

@Controller
@SessionAttributes("board")
public class BoardController {
   
   @Autowired
   private BoardService boardService;
   //검색
   @ModelAttribute("conditionMap")
   public Map<String, String> searchConditionMap() {
      Map<String, String> conditionMap = new HashMap<String, String>();
      conditionMap.put("내용", "CONTENT");
      conditionMap.put("제목", "TITLE");
      return conditionMap;
   }
   
   //이동 컨트롤러
   @RequestMapping("/goWriteBoard")
   public String goBoard(BoardVO vo , Model model) {
      
      System.out.println("noti_writer"+vo.getNoti_writer());
//      model.addAttribute("boardList", boardService.getBoardList(vo));
      return "redirect:boardwrite.jsp";
   }
   
   //글 등록
   
   @RequestMapping("/insertBoard")
   public String insertBoard(BoardVO vo ,Model model , HttpSession session) {
//      if(vo.isNoti_secret()==true & vo.getNoti_writer()== session.getAttribute("mb_id"))
      System.out.println("insertBoard 컨트롤러 시작 ");
      boardService.insertBoard(vo);   
      return "redirect:getBoardList";
      
   }
   
   

   //"uploadFile" 추가시 
//   @PostMapping(value = "/insertBoard")
////   public String insertBoard(MultipartHttpServletRequest request, BoardVO vo) throws IllegalStateException, IOException {
//   public String insertBoard(BoardVO vo) throws IllegalStateException, IOException {
//      MultipartFile uplodFile = vo.getUploadFile();
//      //realPath 추가
////       String realPath = request.getSession().getServletContext().getRealPath("/img/");
//      String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
//       String fileName = uplodFile.getOriginalFilename();
//      if(!uplodFile.isEmpty()) {
//         vo.setFilename(fileName);
//         uplodFile.transferTo(new File(realPath+fileName));
//      }
//      boardService.insertBoard(vo);
//      return "getBoardList";
//   }

   // 글 수정
   @RequestMapping("/updateBoard")
   public String updateBoard(@ModelAttribute("board") BoardVO vo, HttpSession session) {
      System.out.println("updateBoard 컨트롤러 글 수정 기능 전");
      System.out.println("vo 객체" +vo.toString());
      
          
         boardService.updateBoard(vo);
         return "redirect:getBoardList";
      
         
      
      
   }

   // 글 삭제
   @RequestMapping("/deleteBoard")
   public String deleteBoard(BoardVO vo, HttpSession session) {
      System.out.println("deleteBoard 기능 처리 전");
      int val=0;
      System.out.println("val " +val);
//      String realPath = "c:/swork/ticket/src/main/webapp/img/" ;
//      vo = boardService.getBoard(vo);
//      if( vo.getNoti_writer().equals(session.getAttribute("userId").toString()) ) {
//         if(vo.getFilename()!=null) {
//            System.out.println("파일삭제: "+realPath + vo.getFilename());
//            File f = new File(realPath + vo.getFilename());      
//            f.delete();
//         }
         
         boardService.deleteBoard(vo);
         return "redirect:getBoardList";
//      }else {
//         return "getBoard?error=1";
//      }
   }

   // 글 상세 조회
   @RequestMapping("/getBoard")
   public String getBoard(BoardVO vo, Model model) {
     System.out.println("noti_no  상세조회 컨트롤러"+vo.getNoti_no());
      System.out.println("글상세조회");
      model.addAttribute("board", boardService.getBoard(vo));
      System.out.println("글상세조회 수행");
      return "board/getBoard";
   }

   // 글 목록
   @RequestMapping("/getBoardList")
   public String getBoardListPost(BoardVO vo, String nowPageBtn, Model model) {
      System.out.println("글 목록 검색 처리gg");
      String searchKeyword =vo.getSearchKeyword();
      model.addAttribute("searchKeyword",searchKeyword);
      //총 목록 수 
      int totalPageCnt = boardService.totalBoardListCnt(vo);
      System.out.println("totalboardListCnt 수행 완료");
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
      System.out.println("modelAttribute getboardList");
      model.addAttribute("boardList", boardService.getBoardList(vo));
     
      List<BoardVO> boardlist =boardService.getBoardList(vo);
      System.out.println("modelAttribute getBoardList 기능 실행 후 ");
      return "board/boardList";
   }
   
   //파일다운로드
//   @GetMapping(value="/download")
//    public void fileDownLoad(@RequestParam(value="filename", required=false) String filename, 
//          HttpServletRequest request, HttpServletResponse response) throws IOException {
//      System.out.println("파일 다운로드");
//      if (!(filename == null || filename.equals(""))) {
//           //요청파일 정보 불러오기
//           String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
////          String realPath = request.getSession().getServletContext().getRealPath("/img/");
//           File file = new File(realPath+filename);        
//   
//         //한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다
//         String fn = new String(file.getName().getBytes(), "iso_8859_1");
//         
//         //ContentType설정
//         byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
//         response.setHeader("Content-Disposition", "attachment; filename=\""+ fn + "\"");
//         response.setContentLength(bytes.length);
//   //         response.setContentType("image/jpeg");           
//         response.getOutputStream().write(bytes);
//           response.getOutputStream().flush();
//           response.getOutputStream().close();
//        }
//    }
}