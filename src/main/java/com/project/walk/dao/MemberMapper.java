package com.project.walk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.MemberVO;

@Mapper
public interface MemberMapper {

	public void join(MemberVO memberVO); // 회원가입
	public int idDupChk(MemberVO memberVO); // ID중복체크
	
	public MemberVO getMemberById(String username); // 로그인
	
	// 멤버 컨트롤러
	public MemberVO detail(int id);//회원 정보 상세보기
	public void update(MemberVO memberVO);//회원정보 수정
	public void remove(int id);//회원 탈퇴
	
	//회원 리스트, 회원 수 
	public List<MemberVO> list();
	public int count();
	
	public void giveAuth(MemberVO memberVO); // 권한부여
	public void removeAuth(MemberVO memberVO); // 권한회수
	public int isManager(MemberVO memberVO); // 권한확인
	
	
	
}
