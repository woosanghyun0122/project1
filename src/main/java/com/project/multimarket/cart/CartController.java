package com.project.multimarket.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CartController {

	@Resource(name="cartService")
	CartService cartService;
	
	@RequestMapping(value="/cart/insert")
	String cart_insert(Model model, HttpSession session, CartDto dto) {
		
		String userid =(String)session.getAttribute("userid");
		dto.setUserid(userid);
		
		int count = cartService.countCart(dto);
		
		if(count==0) {
			cartService.insert(dto);
		}
		else {
			cartService.update(dto);
		}
		
		return "redirect:/cart/list";
	}


	@RequestMapping(value="/cart/list")
	public String list(HttpSession session, Model model) {
		
		String userid =(String)session.getAttribute("userid");
		System.out.println(userid);
		List<CartDto> list = cartService.getList(userid);
		model.addAttribute("cartList",list);
		System.out.println("list------------" + list);


		
		return "cart/cart";
	}
	
	@RequestMapping(value="/cart/delete")
	public String delete(@RequestParam String cart_id) {
		
		cartService.delete(cart_id);
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value="/cart/deleteall")
	public String deleteAll(@RequestParam String userid,Model model) {
		
		cartService.deleteAll(userid);
		return "redirect:/cart/list";
	}
	
	@RequestMapping(value="/cart/update")
	public String update(@RequestParam String[] amount,@RequestParam String[] product_num, HttpSession session) {
		
		String userid = (String)session.getAttribute("userid");
		for(int i=0; i<product_num.length ;i++) {
			CartDto dto = new CartDto();
			dto.setUserid(userid);
			dto.setAmount(amount[i]);
			dto.setProduct_num(product_num[i]);
			cartService.modify(dto);
		}
		return "redirect:/cart/list";
	}
}
	
	

