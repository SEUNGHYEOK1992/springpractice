package com.spring.dao;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public int idCnt(MemberVO memberVO) {
		return sqlSession.selectOne("memberMapper.idCnt", memberVO);
	}

	@Override
	public void createAuthKey(String memberEmail, String authKey) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberEmail", memberEmail);
		map.put("authKey", authKey);
		
		sqlSession.selectOne("memberMapper.createAuthKey", map);
		
	}

	@Override
	public void memberAuth(String memberEmail) throws Exception {
		sqlSession.update("memberMapper.memberAuth", memberEmail);
	}
	
}
