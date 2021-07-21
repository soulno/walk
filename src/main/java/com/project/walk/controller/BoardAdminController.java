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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.walk.service.BoardAdminService;
import com.project.walk.vo.AttachVO;
import com.project.walk.vo.BoardAdminVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/boardadmin/*")
@Log
public class BoardAdminController {
	@Autowired
	private BoardAdminService boardadminservice;


	// 게시글 리스트
	@GetMapping("/list")
	public List<BoardAdminVO> list(Model model) {
		model.addAttribute("lists", boardadminservice.list());

		return boardadminservice.list();
	}

	// 게시글 상세보기
	@GetMapping("detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		BoardAdminVO boardadmin = boardadminservice.detail(id);
		model.addAttribute("boardadmin", boardadmin);
		return "boardadmin/detail";
	}

	// 글쓰기 폼
	@GetMapping("insert")
	public String insert() {	
	
		return "/boardadmin/insert";
	}

	// 글쓰기
	@PostMapping("insert")
	public String insert(BoardAdminVO boardAdminVO, String pageNum, HttpServletRequest request, RedirectAttributes rttr,
			List<MultipartFile> files) throws Exception {

		 int bnum = boardadminservice.nextBoardNum();

		 boardAdminVO.setBnum(bnum);
		 boardAdminVO.setHitCnt(0);

		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/resources/upload");
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
			attachVO.setBno(boardAdminVO.getBnum());
			attachVO.setUuid(uuid.toString());
			attachVO.setUploadpath(getDateFolder());
			attachVO.setFilename(multipartFile.getOriginalFilename());

			if (isImageType(originalFilename)) {
				attachVO.setFiletype("I");
			} else {
				attachVO.setFiletype("O");
			}
			attachList.add(attachVO);
			boardAdminVO.setUploadpath("/resources/upload/"+attachVO.getUploadpath()+"/"+attachVO.getUuid()+"_"+attachVO.getFilename());
		}

		 boardadminservice.insertBoardAndAttaches(boardAdminVO, attachList);

		rttr.addAttribute("num", boardAdminVO.getBnum());
		rttr.addAttribute("pageNum", pageNum);

		return "redirect:/boardadmin/list";
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
		BoardAdminVO boardadminvo = boardadminservice.detail(id);
		model.addAttribute("boardadminvo", boardadminvo);
		return "boardadmin/update";
	}

	// 수정하기
	@PostMapping("update")
	public String update(BoardAdminVO boardadminvo) {
		boardadminservice.update(boardadminvo);
		
		return "redirect:/boardadmin/detail/"+boardadminvo.getId();
	}

	// 삭제하기
	@DeleteMapping("delete/{bnum}")
	@ResponseBody
	public String delete(@PathVariable int bnum) {
		boardadminservice.delete(bnum);
		return "success";
	}

}