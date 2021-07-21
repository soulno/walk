package com.project.walk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.AttachVO;

@Mapper
public interface AttachAdminMapper {
	
	public int insertAttachAdmin(AttachVO attachVO);
	
	public List<AttachVO> getAttachesAdminByBno(int bno);
	
}
