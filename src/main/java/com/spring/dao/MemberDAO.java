package com.spring.dao;

import com.spring.vo.MemberVO;

public interface MemberDAO {
	
	public void register(MemberVO memberVO) throws Exception;

	public int idCnt(MemberVO memberVO);
	
	public void createAuthKey(String memberEmail,String authKey) throws Exception;
	
	public void memberAuth(String memberEmail) throws Exception;
}
