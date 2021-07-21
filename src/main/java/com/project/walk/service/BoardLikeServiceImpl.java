package com.project.walk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.walk.dao.BoardLikeMapper;
import com.project.walk.vo.BoardLike;

@Service
public class BoardLikeServiceImpl implements BoardLikeService {

	@Autowired
	BoardLikeMapper boardLikeMapper;
	
	@Override
	public void addLike(BoardLike boardLike) {
		boardLikeMapper.addLike(boardLike);
		boardLikeMapper.updateLc(boardLike);
	}

	@Override
	public int totLike(int b_id) {
		return boardLikeMapper.totLike(b_id);
	}

	@Override
	public int alreadyLike(BoardLike boardLike) {
		return boardLikeMapper.alreadyLike(boardLike);	
	}
	
	@Override
	public void subLike(BoardLike boardLike) {
		boardLikeMapper.subLike(boardLike);
		boardLikeMapper.updateLc(boardLike);
	}
	
	// boardlike 게시판과 boarduser 게시판의 likecnt 동기화
	@Override
	public void updateLc(BoardLike boardLike) {
		boardLikeMapper.updateLc(boardLike);
	}

}
