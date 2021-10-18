package com.hyeon.service;

import java.util.List;

import com.hyeon.dto.Member;
import com.hyeon.exception.LoginAuthFailException;
import com.hyeon.exception.MemberExistsException;
import com.hyeon.exception.MemberNotFoundException;

public interface MemberService {
	void addMember(Member member) throws MemberExistsException ;
	void modifyMember(Member member) throws MemberNotFoundException;
	void removeMember(String email) throws MemberNotFoundException;
	Member getMember(String email) throws MemberNotFoundException;
	List<Member> getMemberList();
	void loginAuth(Member member) throws LoginAuthFailException;
}
