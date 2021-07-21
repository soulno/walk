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

import com.project.walk.service.CommentUserService;
import com.project.walk.vo.CommentUserVO;

@RestController
@RequestMapping("/reply/*")
public class CommentUserController {
	
	@Autowired
	private CommentUserService commentuserservice;
	
	//댓글 추가
	@PostMapping("commentInsert")
	@ResponseBody
	public String insert(@RequestBody CommentUserVO commentuserVO) {
		commentuserservice.insert(commentuserVO);
		return "success";
	}
		
	//댓글리스트
	@GetMapping("commentList")
	public List<CommentUserVO> list(int boarduservo_id) {
		List<CommentUserVO> clist = commentuserservice.list(boarduservo_id);
		return clist;
	}
	
	// 댓글삭제
	@DeleteMapping("delete/{id}")
	@ResponseBody
	public int delete(@PathVariable int id) {
		commentuserservice.delete(id);
		return id;
	}
}
