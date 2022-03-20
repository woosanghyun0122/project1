package com.project.multimarket.member;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping(value="/member/login")
	String member_login() {
		
		return "member/login";
	}
	
	@RequestMapping(value="/member/login_proc")
	@ResponseBody
	public HashMap<String, String> memer_login_proc(MemberDto dto, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		System.out.println(session);
		MemberDto resultDto = memberService.member_getInfo(dto);
		System.out.println(resultDto);
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(resultDto == null) {
			map.put("flag", "2");
		}
		else {
			if(resultDto.getPw().equals(dto.getPw())) {
				
				map.put("flag", "1");
				session.setAttribute("userid", resultDto.getUserid());
				session.setAttribute("username", resultDto.getUsername());
				session.setAttribute("phone", resultDto.getPhone());
				session.setAttribute("email", resultDto.getEmail());

				
			}
			else {
				map.put("flag", "3");
			}
			
		}
		return map;
		
	}
	
	@RequestMapping(value="/member/logout")
	public String member_logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/register")
	String member_register(Model model) {
		
		MemberDto dto = new MemberDto();
		model.addAttribute("memberDto",dto);
		
		return "member/register";
	}
	
	@RequestMapping(value="/member/myinfo")
	String member_myinfo(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String userid=(String)session.getAttribute("userid");
		
		if(userid == null) {
			return "redirect:/member/login";
		}
		MemberDto dto = new MemberDto();
		dto.setUserid(userid);
		
		MemberDto resultDto = memberService.member_getInfo(dto);
		model.addAttribute("memberDto",resultDto);
		return "member/mypage";
		
	}
	
	@RequestMapping("/member/isDuplicate")
	@ResponseBody
	public HashMap<String, String> member_isDuplicate(MemberDto dto){
		
		System.out.println("userid : " + dto.getUserid());
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result", memberService.isDuplicate(dto) + "");
		
		return map;
	}
	
	@RequestMapping(value="/member/insert", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, String> member_insert(MemberDto dto)
	{
		System.out.println("회원가입3");
		System.out.println("userid : " + dto.getUserid());
		memberService.member_insert(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping(value="/member/update")
	@ResponseBody
	public HashMap<String, String> member_update(MemberDto dto)
	{	
		memberService.update(dto);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", "success");	
		return map;
	}

	@RequestMapping(value="/member/findid")
	String member_findid() {
		
		return "member/findid";
	}
	
	@RequestMapping(value="/member/findid_proc")
	@ResponseBody
	public HashMap<String, String> member_findid_proc(MemberDto dto)
	{	

		String username = dto.getUsername();
		System.out.println(username);
		String email = dto.getEmail();
		System.out.println(email);
		String phone = dto.getPhone();
		System.out.println(phone);
		
		MemberDto findDto = memberService.member_findid(dto);
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		if (findDto==null)
			map.put("result", "fail");
		else
		{
			map.put("result", findDto.getUserid());
			map.put("username", findDto.getUsername());
			map.put("phone", findDto.getPhone());
			map.put("email", findDto.getEmail());
		}
		return map;
	}
		
	
	
	@RequestMapping(value="/member/findpw")
	String member_findpw() {
		
		return "member/findpw";
	}
	
	@RequestMapping(value="/member/findpw_proc")
	@ResponseBody
	public HashMap<String, String> member_findpass_proc(MemberDto dto)
	{	
		System.out.println(dto);
		
		MemberDto findDto = memberService.member_findpw(dto);
		System.out.println(findDto);
		HashMap<String, String> map = new HashMap<String, String>();
		
		
		
		if (findDto==null) {
			map.put("result", "fail");
		}
		else
		{
			map.put("result", findDto.getPw());
			map.put("userid", findDto.getUserid());
			map.put("username", findDto.getUsername());
			map.put("phone", findDto.getPhone());

			
		}
		return map;
	}

}
