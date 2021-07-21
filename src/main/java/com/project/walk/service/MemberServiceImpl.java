package com.project.walk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.walk.dao.MemberMapper;
import com.project.walk.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void join(MemberVO memberVO) {
		memberMapper.join(memberVO);
	}

	@Override
	public MemberVO getMemberById(String username) {
		return memberMapper.getMemberById(username);
	}

	@Override
	public MemberVO detail(int id) {
		return memberMapper.detail(id);
	}

	@Override
	public void update(MemberVO memberVO) {
		memberMapper.update(memberVO);		
	}

	@Override
	public void remove(int id) {
		memberMapper.remove(id);
	}

	@Override
	public List<MemberVO> list() {
		return memberMapper.list();
	}

	@Override
	public int count() {
		return memberMapper.count();
	}

	@Override
	public void giveAuth(MemberVO memberVO) {
		memberMapper.giveAuth(memberVO);
	}

	@Override
	public void removeAuth(MemberVO memberVO) {
		memberMapper.removeAuth(memberVO);
	}

	@Override
	public int isManager(MemberVO memberVO) {
		return memberMapper.isManager(memberVO);
	}

	@Override
	public int idDupChk(MemberVO memberVO) {
		return  memberMapper.idDupChk(memberVO);
	}

}