package com.project.multimarket.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping(value="/member/login")
	String member_login(MemberDto dto) {
		
		return "member/login";
	}
	
	@RequestMapping(value="/member/register")
	String member_register(MemberDto dto) {
		
		return "member/register";
	}

}
