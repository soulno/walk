package com.project.walk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.BoardUserVO;

@Mapper
public interface BoardUserMapper {
	
	public List<BoardUserVO> list();//게시글 리스트 보기
	public List<BoardUserVO> bestList(); // 베스트 추천
	public void insert(BoardUserVO boardUserVO);//게시글 쓰기
	
	int getTotalCount(); // 전체 글개수 가져오기
	int nextBoardNum(); // 다음 insert할 글번호 생성하기
	void updateHitcount(int id); // 글의 조회수 1 증가시키기
	
	public BoardUserVO detail(int id);//게시글 상세보기
	public void update(BoardUserVO boardUserVO);//게시글 수정
	public void delete(int id);//글 삭제
	
}
