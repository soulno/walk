package com.project.walk.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int id;
	private String password;
	private String username;
	private String email;
	private String addr;
	private Date regdate;
	private int auth;  // 1 관리자 2 매니저 3 일반유저
	
}
