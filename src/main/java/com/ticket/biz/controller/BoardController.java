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
      
//      model.addAttribute("boardList", boardService.getBoardList(vo));
      return "redirect:boardwrite.jsp";
   }
   
   //글 등록
   
   @RequestMapping("/insertBoard")
   public String insertBoard(BoardVO vo ,Model model , HttpSession session) {
//      if(vo.isNoti_secret()==true & vo.getNoti_writer()== session.getAttribute("mb_id"))
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
      
          
         boardService.updateBoard(vo);
         return "redirect:getBoardList";
      
         
      
      
   }

   // 글 삭제
   @RequestMapping("/deleteBoard")
   public String deleteBoard(BoardVO vo, HttpSession session) {
      int val=0;
//      String realPath = "c:/swork/ticket/src/main/webapp/img/" ;
//      vo = boardService.getBoard(vo);
//      if( vo.getNoti_writer().equals(session.getAttribute("userId").toString()) ) {
//         if(vo.getFilename()!=null) {
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
      model.addAttribute("board", boardService.getBoard(vo));
      return "board/getBoard";
   }

   // 글 목록
   @RequestMapping("/getBoardList")
   public String getBoardListPost(BoardVO vo, String nowPageBtn, Model model) {
      String searchKeyword =vo.getSearchKeyword();
      model.addAttribute("searchKeyword",searchKeyword);
      //총 목록 수 
      int totalPageCnt = boardService.totalBoardListCnt(vo);
      //현재 페이지 설정 
      int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
      
      //한페이지당 보여줄 목록 수
      int onePageCnt = 10;
      
      //한 번에 보여질 버튼 수
      int oneBtnCnt = 5;
      PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
      vo.setOffset(pvo.getOffset());
      
      
      model.addAttribute("paging", pvo);
      model.addAttribute("boardList", boardService.getBoardList(vo));
     
      List<BoardVO> boardlist =boardService.getBoardList(vo);
      return "board/boardList";
   }
   
   //파일다운로드
//   @GetMapping(value="/download")
//    public void fileDownLoad(@RequestParam(value="filename", required=false) String filename, 
//          HttpServletRequest request, HttpServletResponse response) throws IOException {
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