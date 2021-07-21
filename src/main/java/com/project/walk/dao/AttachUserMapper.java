package com.project.walk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.AttachVO;

@Mapper
public interface AttachUserMapper {
	
	public int insertAttachUser(AttachVO attachVO);
	
	public List<AttachVO> getAttachesUserByBno(int bno);
	
}
