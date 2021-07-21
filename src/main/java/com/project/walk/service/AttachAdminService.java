package com.project.walk.service;

import java.util.List;

import com.project.walk.vo.AttachVO;

public interface AttachAdminService {
	
	public int insertAttachAdmin(AttachVO attachVO);
	
	public List<AttachVO> getAttachesAdminByBno(int bno);
	
}
