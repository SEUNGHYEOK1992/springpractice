package com.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.spi.FileSystemProvider;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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

	@PostMapping("/idCnt")
	public String idCnt (@RequestBody String filterJSON,HttpServletResponse response, ModelMap model) throws IOException {
		System.out.println("idCnt");
		JSONObject resMap= new JSONObject(); // 제이슨을 받기 위해 사용
		try { 
			ObjectMapper mapper = new ObjectMapper(); // 오브젝트 맵퍼를 통해 형태를 원하는 타입으로 받을 수 있다.
			MemberVO searchVO = (MemberVO) mapper.readValue(filterJSON, new TypeReference<MemberVO>()
					{});
			int idCnt = memberService.idCnt(searchVO);
			System.out.println(idCnt+"idCnt");
			resMap.put("res", "ok");
			resMap.put("idCnt", idCnt);
			
		}catch(Exception e) {
			System.out.println(e.toString());
			resMap.put("res","error");
		}
		
		response.setContentType("text/html: charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(resMap);
		return null;
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
