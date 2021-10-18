package com.hyeon.service;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hyeon.dao.MemberDAO;
import com.hyeon.dto.Member;
import com.hyeon.exception.LoginAuthFailException;
import com.hyeon.exception.MemberExistsException;
import com.hyeon.exception.MemberNotFoundException;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Transactional
	@Override
	public void addMember(Member member) throws MemberExistsException {
		if(memberDAO.selectMember(member.getEmail()) != null) {
			throw new MemberExistsException("이미 존재하는 이메일입니다.", member);
		}
		
		member.setPassword(BCrypt.hashpw(member.getPassword(), BCrypt.gensalt()));
		
		memberDAO.insertMember(member);
	}

	@Transactional
	@Override
	public void modifyMember(Member member) throws MemberNotFoundException {
		if(memberDAO.selectMember(member.getEmail()) == null) {
			throw new MemberNotFoundException("해당 이메일의 회원이 존재하지 않습니다.");
		}
		
		String password = member.getPassword();
		if(password != null && password.equals("")) {
			member.setPassword(BCrypt.hashpw(member.getPassword(), BCrypt.gensalt()));
		}
		
		memberDAO.updateMember(member);
	}

	@Transactional
	@Override
	public void removeMember(String email) throws MemberNotFoundException {
		if(memberDAO.selectMember(email) == null) {
			throw new MemberNotFoundException("해당 이메일의 회원이 존재하지 않습니다.");
		}
		
		memberDAO.deleteMember(email);
	}

	@Override
	public Member getMember(String email) throws MemberNotFoundException {
		if(memberDAO.selectMember(email) == null) {
			throw new MemberNotFoundException("해당 이메일의 회원이 존재하지 않습니다.");
		}
		
		return memberDAO.selectMember(email);
	}

	@Override
	public List<Member> getMemberList() {
		return memberDAO.selectMemberList();
	}

	@Override
	public void loginAuth(Member member) throws LoginAuthFailException {
		Member authMember = memberDAO.selectMember(member.getEmail());
		if(authMember == null) {
			throw new LoginAuthFailException("이메일이 맞지 않습니다.", member.getEmail());
		}
		
		if(!BCrypt.checkpw(member.getPassword(), authMember.getPassword())) {
			throw new LoginAuthFailException("비밀번호 또는 이메일이 맞지 않습니다.", member.getEmail());
		}
		
		memberDAO.updateLoginDate(member.getEmail());
	}
}
