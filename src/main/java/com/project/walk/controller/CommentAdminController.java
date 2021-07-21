package com.project.walk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.walk.service.CommentAdminService;
import com.project.walk.vo.CommentAdminVO;

@RestController
@RequestMapping("/replyadmin/*")
public class CommentAdminController {
	
	@Autowired
	private CommentAdminService commentadminservice;
	
	//댓글 추가
	@PostMapping("commentInsert")
	@ResponseBody
	public String insert(@RequestBody CommentAdminVO commentadminVO) {
		commentadminservice.insert(commentadminVO);
		return "success";
	}
		
	//댓글리스트
	@GetMapping("commentList")
	public List<CommentAdminVO> list(int boardadminvo_id) {
		List<CommentAdminVO> clist = commentadminservice.list(boardadminvo_id);
		return clist;
	}
		
	// 댓글 삭제
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public int delete(@PathVariable int id) {
		commentadminservice.delete(id);
		return id;
	}
	
}