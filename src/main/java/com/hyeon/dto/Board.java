package com.hyeon.dto;

/*
create table board(num number primary key, writer varchar2(50), subject varchar2(100), content varchar2(100)
    , regdate date, code varchar2(20), status number(1),
    constraint member_writer_fk foreign key(writer) references member(email) );
create SEQUENCE board_seq;
*/
public class Board {
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String regdate;
	private String code;//공지사항, 게시글 구분 컬럼
	private int status;//삭제 상태 -  0 : 기본, 1 : 삭제
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
