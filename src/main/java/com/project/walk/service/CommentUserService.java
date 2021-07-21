package com.project.walk.service;

import java.util.List;

import com.project.walk.vo.CommentUserVO;

public interface CommentUserService {
	
	public List<CommentUserVO> list(int boarduservo_id);// 댓글리스트
	public void insert(CommentUserVO commentuserVO);// 댓글쓰기
	public void delete(int id);// 댓글삭제
}
