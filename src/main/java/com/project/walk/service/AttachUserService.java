package com.project.walk.service;

import java.util.List;

import com.project.walk.vo.AttachVO;

public interface AttachUserService {
	
	public int insertAttachUser(AttachVO attachVO);
	
	public List<AttachVO> getAttachesUserByBno(int bno);
	
}
