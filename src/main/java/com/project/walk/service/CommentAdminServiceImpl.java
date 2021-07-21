package com.project.walk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.walk.dao.CommentAdminMapper;
import com.project.walk.vo.CommentAdminVO;

@Service
public class CommentAdminServiceImpl implements CommentAdminService{
	
	@Autowired
	private CommentAdminMapper commentadminmapper;
	
	@Override
	public List<CommentAdminVO> list(int boardadminvo_id) {
		return commentadminmapper.list(boardadminvo_id);
	}

	@Override
	public void insert(CommentAdminVO commentadminVO) {
		commentadminmapper.insert(commentadminVO);		
	}

	@Override
	public void delete(int id) {
		commentadminmapper.delete(id);
	}

}