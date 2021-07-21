package com.project.walk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.walk.dao.AttachAdminMapper;
import com.project.walk.vo.AttachVO;

@Service
public class AttachServiceImpl implements AttachAdminService {

	@Autowired
	private AttachAdminMapper attachAdminMapper;
	

	@Override
	public int insertAttachAdmin(AttachVO attachVO) {
		return attachAdminMapper.insertAttachAdmin(attachVO);
	}

	@Override
	public List<AttachVO> getAttachesAdminByBno(int bno) {
		// TODO Auto-generated method stub
		return null;
	}
		
}