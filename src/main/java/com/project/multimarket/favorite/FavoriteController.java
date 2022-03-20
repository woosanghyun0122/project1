package com.project.multimarket.favorite;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FavoriteController {
	
	@Resource(name="favoriteService")
	FavoriteService service;

	@RequestMapping(value="/favorite/list")
	public String list(HttpSession session, Model model,FavoriteDto dto) {
		
		String userid = (String)session.getAttribute("userid");
		System.out.println("userid------>"+userid);
		dto.setUserid(userid);
	
			model.addAttribute("totalCnt",service.count(dto));

		List<FavoriteDto> list = service.getList(userid);
		model.addAttribute("favoriteList",list);
		model.addAttribute("totalCnt",service.count(dto));
		System.out.println("totalCnt controller---->"+service.count(dto));
		System.out.println("list-------->"+list);
		
		return "favorite/favorite";
	}
	

	
	@RequestMapping("/favorite/isDuplicate")
	@ResponseBody
	public HashMap<String, String>favorite_isDuplicate(FavoriteDto dto){
		
		System.out.println("userid :" + dto.getUserid());
		HashMap<String, String>map = new HashMap<String, String>();
		
		map.put("result", service.isDuplicate(dto)+"");
		return map;
	}
	
	@RequestMapping(value="/favorite/insert")
	String insert(Model model, HttpSession session, FavoriteDto dto) {
		
		String userid = (String)session.getAttribute("userid");
		
		if(!service.isDuplicate(dto))
			service.insert(dto);

		return "redirect:/favorite/list";
	}
	
	@RequestMapping(value="/favorite/delete")
	public String delete(@RequestParam String favorite_id) {
		
		service.delete(favorite_id);
		return "redirect:/favorite/list";
	}
	
	@RequestMapping(value="/favorite/deleteall")
	public String deleteAll(@RequestParam String userid,Model model) {
		
		service.deleteAll(userid);
		return "redirect:/favorite/list";
	}
	
	
}
