package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void register(MemberVO memberVO) throws Exception {
		sqlSession.insert("memberMapper.register", memberVO);
	}
	
}
