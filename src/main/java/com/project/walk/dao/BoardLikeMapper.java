package com.project.walk.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.BoardLike;

@Mapper
public interface BoardLikeMapper {
	
	public void addLike(BoardLike boardLike);
	public void updateLc(BoardLike boardLike);
	
	public int totLike(int b_id);
	
	public int alreadyLike(BoardLike boardLike);
	
	public void subLike(BoardLike boardLike);
}
