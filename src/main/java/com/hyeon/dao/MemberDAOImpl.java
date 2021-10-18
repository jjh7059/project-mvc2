package com.hyeon.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyeon.dto.Member;
import com.hyeon.mapper.MemberMapper;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.getMapper(MemberMapper.class).updateMember(member);
	}

	@Override
	public int deleteMember(String email) {
		return sqlSession.getMapper(MemberMapper.class).deleteMember(email);
	}

	@Override
	public Member selectMember(String email) {
		return sqlSession.getMapper(MemberMapper.class).selectMember(email);
	}

	@Override
	public List<Member> selectMemberList() {
		return sqlSession.getMapper(MemberMapper.class).selectMemberList();
	}

	@Override
	public int updateLoginDate(String email) {
		return sqlSession.getMapper(MemberMapper.class).updateLoginDate(email);
	}
}
