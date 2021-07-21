package com.project.walk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.walk.vo.AttachVO;
import com.project.walk.vo.BoardAdminVO;

@Mapper
public interface BoardAdminMapper {
	public List<BoardAdminVO> list();//게시글 리스트 보기
	public void insert(BoardAdminVO boardadminVO);//게시글 쓰기
	public void insertBoardAndAttaches(BoardAdminVO boardadminVO, List<AttachVO> attachList);
	
	int getTotalCount(); // 전체 글개수 가져오기
	int nextBoardNum(); // 다음 insert할 글번호 생성하기
	void updateHitcount(int num); // 글의 조회수 1 증가시키기
	
	public BoardAdminVO detail(int id);//게시글 상세보기
	public String update(BoardAdminVO boardAdminVO);//게시글 수정
	public void delete(int id);//글 삭제
}
