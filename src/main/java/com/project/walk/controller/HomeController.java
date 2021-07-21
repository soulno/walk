package com.project.walk.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.walk.service.MemberService;
import com.project.walk.util.Script;
import com.project.walk.vo.MemberVO;


@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
	@GetMapping("join")
	public String join() {
		return "join";
	}
	
	@PostMapping("join")
	public ResponseEntity<String> join(MemberVO memberVO) {
		
		int idDupChk = memberService.idDupChk(memberVO);
		if (idDupChk==1) {
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");
			String str = Script.back("이미 사용중인 ID 입니다.");
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		memberService.join(memberVO);
		String str = Script.href("회원가입 완료", "login");
		
		return new ResponseEntity<String> (str, HttpStatus.OK);
	}
	
	@GetMapping("login")
	public String login() {
		return "login";
	}
	
	@PostMapping("login")
	public ResponseEntity<String> login(String username, String password, HttpSession session) {
		MemberVO memberVO = memberService.getMemberById(username);
		
		boolean isSamePasswd = false;
		
		String message = "";

		if (memberVO != null) { // 일치하는 아이디 있음
			isSamePasswd = password.equals(memberVO.getPassword());
			
			if (!isSamePasswd) { // 패스워드 일치하지 않음
				message = "패스워드가 일치하지 않습니다.";
			}
		} else { // 일치하는 아이디가 없음
			message = "존재하지 않는 아이디 입니다.";
		}
		
		
		if (memberVO == null || isSamePasswd == false) {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");
			
			String str = Script.back(message);
			
			return new ResponseEntity<String>(str, headers, HttpStatus.OK);
		}
		
		session.setAttribute("memberVO", memberVO);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Location", "/");
		
		return new ResponseEntity<String>(headers, HttpStatus.FOUND);
	}
}
