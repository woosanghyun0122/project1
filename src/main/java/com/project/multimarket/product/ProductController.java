package com.project.multimarket.product;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.multimarket.member.MemberDto;
import com.project.multimarket.member.MemberService;

@Controller
public class ProductController {

	@Resource(name="productService")
	ProductService productService;
	
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping(value="/product/list/{category}")
	String product_getlist(Model model, ProductDto dto, @PathVariable String category) {
		
		// 파라미터 
		System.out.println("dto-------------------------" + dto);
		String result="";
		List<ProductDto> list;
		System.out.println("category----------" + category);

		// 리스트 
		
		
		if(category.equals("m")) {
			dto.setSex(category);
			list = productService.getList(dto);
			System.out.println("list----------" + list);
			model.addAttribute("menList",list);
			model.addAttribute("totalCnt",productService.getTotal(dto));
			result="product/product_menlist";
		}
		else if(category.equals("f")){
			dto.setSex(category);
			list = productService.getList(dto);
			System.out.println("list----------" + list);

			model.addAttribute("womenList",list);
			model.addAttribute("totalCnt",productService.getTotal(dto));
			result= "product/product_womenlist";
		}
		else if(category.equals("o")) {
			dto.setSale(category);
			list = productService.getList(dto);
			System.out.println("list----------" + list);
			model.addAttribute("saleList",list);
			model.addAttribute("totalCnt",productService.getSaleTotal(dto));
			result="product/product_salelist";
		}
		return result;
	}
	
	@RequestMapping(value="/product/view",method=RequestMethod.GET)
	String product_view(HttpServletRequest request, String num, Model model) {
		
		ProductDto dto = productService.getView(num);
		List<ProductDto> relatedItemsList = productService.getRelateItems(num);
		System.out.println(relatedItemsList);
		
		HttpSession session = request.getSession();
		String userid= (String) session.getAttribute("userid");
		MemberDto mDto = null;
		if(userid!=null) {
			MemberDto memberDto = new MemberDto();
			memberDto.setUserid(userid);
			mDto = memberService.member_getInfo(memberDto);		
		}
		
		model.addAttribute("productDto",dto);
		model.addAttribute("relatedItemsList",relatedItemsList);
		model.addAttribute("memberDto", mDto);
		return "product/product_view";
	}
	
	
	
	
	@RequestMapping(value="/product/brand/{category}",method=RequestMethod.GET)
	String product_brand(ProductDto dto, Model model, @PathVariable String category) {
		
		System.out.println("dto-------------------------" + dto);
		String result="";
		List<ProductDto> list;
		System.out.println("category----------" + category);

		// 리스트 
		
		
		if(category.equals("Nike")) {
			dto.setBrand(category);
			list = productService.brandList(dto);
			System.out.println("list----------" + list);
			model.addAttribute("nikeList",list);
			model.addAttribute("totalCnt",productService.getBrandTotal(dto));
			result="product/product_Nike";
		}
		else if(category.equals("Adidas")){
			dto.setBrand(category);
			list = productService.brandList(dto);
			System.out.println("list----------" + list);

			model.addAttribute("adidasList",list);
			model.addAttribute("totalCnt",productService.getBrandTotal(dto));
			result= "product/product_Adidas";
		}
		else if(category.equals("NewBalance")) {
			dto.setBrand(category);
			list = productService.brandList(dto);
			System.out.println("list----------" + list);
			model.addAttribute("nbList",list);
			model.addAttribute("totalCnt",productService.getBrandTotal(dto)); 
			result="product/product_NB";
		}

		return result;
	}
	@RequestMapping(value="/",method=RequestMethod.GET)
	String product_main(Model model, String num) {
		
		ProductDto dto = productService.getView(num);
		List<ProductDto> relatedItemsList = productService.getRelateItems(num);
		List<ProductDto> mainList = productService.main(num);

		System.out.println(relatedItemsList);
		
		
		model.addAttribute("productDto",dto);
		model.addAttribute("relatedItemsList",relatedItemsList);
		model.addAttribute("mainList",mainList);

		return "product/product_main";
	}
	
	}

		
	


