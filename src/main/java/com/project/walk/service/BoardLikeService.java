package com.project.walk.service;

import com.project.walk.vo.BoardLike;

public interface BoardLikeService {
	
	public void addLike(BoardLike boardLike);
	
	public int totLike(int b_id);
	
	public int alreadyLike(BoardLike boardLike);
	
	public void subLike(BoardLike boardLike);
	
	public void updateLc(BoardLike boardLike);

}
