package com.hyeon.cowork;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyeon.dto.Book;
import com.hyeon.service.BookService;

@Controller
public class BookController {
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking() {
		return "reservation/booking";
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.POST)
	public String booking(@ModelAttribute Book book) {
		bookService.addBooking(book);
		return "main";
	}
}
