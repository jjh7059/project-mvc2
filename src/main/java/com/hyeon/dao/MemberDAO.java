package com.hyeon.dao;

import java.util.List;

import com.hyeon.dto.Member;

public interface MemberDAO {
	int insertMember(Member member);
	int updateMember(Member member);
	int updateLoginDate(String email);
	int deleteMember(String email);
	Member selectMember(String email);
	List<Member> selectMemberList();
}
