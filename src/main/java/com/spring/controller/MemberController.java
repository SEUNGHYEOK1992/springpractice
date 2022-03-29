package com.spring.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.MemberService;
import com.spring.vo.MemberVO;

@Controller
public class MemberController {
	
	@Inject 
	private MemberService memberService;
	
	@GetMapping("/signup")
	public String signup() throws Exception{
		System.out.println("signup");
		return "/signup";
	}
	
	@PostMapping("/register")
	public String register(MemberVO memberVO, RedirectAttributes rttr) throws Exception{
		System.out.println(memberVO.getUserId()+"ss");
		String hashedPw = BCrypt.hashpw(memberVO.getUserPwd(), BCrypt.gensalt());
		memberVO.setUserPwd(hashedPw);
		memberService.register(memberVO);
		
		rttr.addFlashAttribute("msg", "가입이 완료되었습니다");
		
		return "redirect:/";
	}
	
}
