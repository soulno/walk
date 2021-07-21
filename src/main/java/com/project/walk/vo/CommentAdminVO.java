package com.project.walk.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentAdminVO {
	
	private String username;
	private int id;
	private String content;
	private Date regdate;
	private int boardadminvo_id;
}
