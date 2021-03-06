package com.spring.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dao.MemberDAO;
import com.spring.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		memberDAO.register(memberVO);
	}

	@Override
	public int idCnt(MemberVO memberVO) {
		return memberDAO.idCnt(memberVO);
	}

	@Override
	public MemberVO checkLoginBefore(String value) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberAuth(String memberEmail) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
