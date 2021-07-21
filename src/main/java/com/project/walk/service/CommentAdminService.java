package com.project.walk.service;

import java.util.List;

import com.project.walk.vo.CommentAdminVO;

public interface CommentAdminService {
	public List<CommentAdminVO> list(int boardadminvo_id);// 댓글리스트
	public void insert(CommentAdminVO commentadminVO);// 댓글쓰기
	public void delete(int id);// 댓글삭제
}