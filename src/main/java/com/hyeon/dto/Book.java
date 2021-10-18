package com.hyeon.dto;

/*
create table book(
    num number primary key, loc varchar2(10), room varchar2(50), email varchar2(50), bdate varchar2(20),
    btime varchar2(20), status number(1),
    constraint book_member_fk foreign key(email) references member(email)
);

create sequence book_seq;
*/

public class Book {
	private int num;
	private String loc;
	private String room;
	private String email;
	private String bdate;
	private String btime;
	private int status;//예약중 : 1, 종료 : 9
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBtime() {
		return btime;
	}

	public void setBtime(String btime) {
		this.btime = btime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
