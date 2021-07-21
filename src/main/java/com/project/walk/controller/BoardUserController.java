package com.project.walk.controller;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.walk.service.BoardLikeService;
import com.project.walk.service.BoardUserService;
import com.project.walk.service.CommentUserService;
import com.project.walk.vo.AttachVO;
import com.project.walk.vo.BoardLike;
import com.project.walk.vo.BoardUserVO;
import com.project.walk.vo.CommentUserVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/boarduser/*")
@Log
public class BoardUserController {
	@Autowired
	private BoardUserService boarduserservice;

	@Autowired
	private BoardLikeService boardlikeservice;

	@Autowired
	private CommentUserService commentuserservice;

	// 게시글 리스트
	@GetMapping("/list")
	public List<BoardUserVO> list(Model model) {
		model.addAttribute("lists", boarduserservice.list());

		return boarduserservice.list();
	}

	// 게시글 상세보기
	@GetMapping("detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		BoardUserVO boarduser = boarduserservice.detail(id);
		model.addAttribute("boarduser", boarduser);
		int b_id = boardlikeservice.totLike(boarduser.getId());
		BoardLike bl = new BoardLike();
		bl.setCntlike(b_id);
		model.addAttribute("bl", bl);
		
		return "boarduser/detail";
	}

	// 글쓰기 폼
	@GetMapping("insert")
	public String insert() {
		return "/boarduser/insert";
	}

	// 글쓰기
	@PostMapping("insert")
	public String insert(BoardUserVO boardUserVO, String pageNum, HttpServletRequest request, RedirectAttributes rttr,
			List<MultipartFile> files, Model model) throws Exception {

		int bnum = boarduserservice.nextBoardNum();

		boardUserVO.setBnum(bnum);
		boardUserVO.setHitCnt(0);

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/resources/upload/");
		log.info("realPath : " + realPath);


		File uploadPath = new File(realPath, getDateFolder());

		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		List<AttachVO> attachList = new ArrayList<AttachVO>();

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}

			String originalFilename = multipartFile.getOriginalFilename();

			UUID uuid = UUID.randomUUID();
			String uploadFilename = uuid.toString() + "_" + originalFilename;

			multipartFile.transferTo(new File(uploadPath, uploadFilename));

			AttachVO attachVO = new AttachVO();
			attachVO.setBno(boardUserVO.getBnum());
			attachVO.setUuid(uuid.toString());
			attachVO.setUploadpath(getDateFolder());
			attachVO.setFilename(multipartFile.getOriginalFilename());
			if (isImageType(originalFilename)) {
				attachVO.setFiletype("I");
			} else {
				attachVO.setFiletype("O");
			}
			attachList.add(attachVO);
		boardUserVO.setUploadpath("/resources/upload/"+attachVO.getUploadpath()+"/"+attachVO.getUuid()+"_"+attachVO.getFilename());
		}
		
		boarduserservice.insertBoardAndAttaches(boardUserVO, attachList);

//		rttr.addAttribute("num", boardUserVO.getBnum());
//		rttr.addAttribute("pageNum", pageNum);

		return "redirect:/boarduser/list";
	}

	private String getDateFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str;
	}

	private boolean isImageType(String filename) {
		int index = filename.lastIndexOf(".") + 1;
		String ext = filename.substring(index);

		boolean result = false;
		ext = ext.toLowerCase();
		if (ext.equals("jpeg") || ext.equals("jpg") || ext.equals("png") || ext.equals("gif")) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}
	
	// 수정 폼
	@GetMapping("update/{id}")
	public String update(Model model, @PathVariable int id) {
		BoardUserVO boarduser = boarduserservice.detail(id);
		model.addAttribute("boarduser", boarduser);
		return "boarduser/update";
	}

	// 수정하기
	@PostMapping("update") 
	public String update(BoardUserVO boardUserVO) {
		boarduserservice.update(boardUserVO);
		return "redirect:/boarduser/detail/"+boardUserVO.getId();
	}

	// 댓글 추가
	@PostMapping("commentInsert")
	@ResponseBody
	public String insert(@RequestBody CommentUserVO CommentUserVO) {
		commentuserservice.insert(CommentUserVO);
		return "success";
	}

	// 댓글리스트
	@GetMapping("commentList")
	public List<CommentUserVO> list(int boarduservo_id) {
		List<CommentUserVO> clist = commentuserservice.list(boarduservo_id);
		return clist;
	}
	
	// 글 삭제하기
	 @DeleteMapping("delete/{id}")
	 @ResponseBody
	 public String delete(@PathVariable int id) {
		 boarduserservice.delete(id);
		 return "success";
	 }	

	// 좋아요
	@PostMapping("like/{bnum}")
	@ResponseBody
	public String like(@PathVariable int bnum, @RequestBody BoardLike bl) {
		
		int isAlreadyLike = boardlikeservice.alreadyLike(bl);
		
		if(isAlreadyLike == 0) {
			boardlikeservice.addLike(bl);

		} else {
			boardlikeservice.subLike(bl);
		}
		
		return "success";
	}
	
	// 추천게시판
	@GetMapping("best")
	public List<BoardUserVO> bestList(Model model) {
		model.addAttribute("b_lists", boarduserservice.bestList());

		return boarduserservice.bestList();
	}

}
