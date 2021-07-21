package com.project.walk.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardAdminVO {
	private int id;
	private int bnum; // 글번호
	private String title;
	private String writer;
	private String content;
	private MultipartFile uploadimg;
	private Date regDate;
	private int hitCnt;
	private int membervo_id;
	private String uploadpath;

}

