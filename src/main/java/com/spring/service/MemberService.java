package com.spring.service;

import org.springframework.stereotype.Service;

import com.spring.vo.MemberVO;

public interface MemberService {
	
	public void register(MemberVO memberVO) throws Exception;
}
