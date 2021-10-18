package com.hyeon.cowork;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyeon.dto.Member;
import com.hyeon.exception.LoginAuthFailException;
import com.hyeon.exception.MemberExistsException;
import com.hyeon.exception.MemberNotFoundException;
import com.hyeon.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginVerify(@ModelAttribute Member member, HttpSession session) throws MemberNotFoundException, LoginAuthFailException {
			memberService.loginAuth(member);
			session.setAttribute("loginMember", memberService.getMember(member.getEmail()));
		return "main";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String login(@ModelAttribute Member member, Model model) throws MemberExistsException {
			model.addAttribute("success_message","회원가입에 성공했습니다.");
			memberService.addMember(member);
		return "member/login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	@ExceptionHandler
	public String exceptionHandler(MemberExistsException exception, Model model) {
		model.addAttribute("message", exception.getMessage());
		model.addAttribute("member", exception.getMember());
		return "member/login";
	}
	
	@ExceptionHandler(LoginAuthFailException.class)
	public String exceptionHandler(LoginAuthFailException exception, Model model) {
		model.addAttribute("login_message", exception.getMessage());
		model.addAttribute("userinfo", exception.getEmail());
		return "member/login";
	}
}
