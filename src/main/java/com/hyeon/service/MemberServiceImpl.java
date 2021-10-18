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
			throw new MemberExistsException("�̹� �����ϴ� �̸����Դϴ�.", member);
		}
		
		member.setPassword(BCrypt.hashpw(member.getPassword(), BCrypt.gensalt()));
		
		memberDAO.insertMember(member);
	}

	@Transactional
	@Override
	public void modifyMember(Member member) throws MemberNotFoundException {
		if(memberDAO.selectMember(member.getEmail()) == null) {
			throw new MemberNotFoundException("�ش� �̸����� ȸ���� �������� �ʽ��ϴ�.");
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
			throw new MemberNotFoundException("�ش� �̸����� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		memberDAO.deleteMember(email);
	}

	@Override
	public Member getMember(String email) throws MemberNotFoundException {
		if(memberDAO.selectMember(email) == null) {
			throw new MemberNotFoundException("�ش� �̸����� ȸ���� �������� �ʽ��ϴ�.");
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
			throw new LoginAuthFailException("�̸����� ���� �ʽ��ϴ�.", member.getEmail());
		}
		
		if(!BCrypt.checkpw(member.getPassword(), authMember.getPassword())) {
			throw new LoginAuthFailException("��й�ȣ �Ǵ� �̸����� ���� �ʽ��ϴ�.", member.getEmail());
		}
		
		memberDAO.updateLoginDate(member.getEmail());
	}
}
