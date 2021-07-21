package com.project.walk.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentUserVO {
	
	private String username;
	private int id;
	private String content;
	private Date regdate;
	private int boarduservo_id;
}
