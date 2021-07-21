package com.project.walk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.CommentAdminVO;

@Mapper
public interface CommentAdminMapper {

	public List<CommentAdminVO> list(int boardadminvo_id);// 댓글리스트
	public void insert(CommentAdminVO commentadminVO);// 댓글쓰기
	public void delete(int id);// 댓글삭제
	
}
