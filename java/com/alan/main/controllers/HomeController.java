package com.alan.main.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alan.main.models.Book;
import com.alan.main.models.LoginUser;
import com.alan.main.models.User;
import com.alan.main.services.BookService;
import com.alan.main.services.UserService;

@Controller
public class HomeController {
    
    @Autowired
    private UserService userServ;
    @Autowired
    private BookService bookServ;
    
    
    
//    route to login and reg home page
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
//    register Method
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        session.setAttribute("user_id", newUser.getId());
        return "redirect:/home";
    }
//    login Method
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("user_id", user.getId());
        return "redirect:/home";
    }
//    getting in to dashboard
    @GetMapping("/home")
    public String home(HttpSession session, Model model) {
    	Long userId =(Long) session.getAttribute("user_id");
    	if(userId == null) {
    		return "redirect:/";
       	}else {
       		List<Book> allBooks = bookServ.allBooks();
       		model.addAttribute("allBooks", allBooks);
       		User currentUser = userServ.findOne(userId);
       		model.addAttribute("name",currentUser.getUserName());
       		return "home.jsp";
       	}
    }
//    logging out
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
//    go to add a book view
    @RequestMapping("/addBook")
    public String addBook(HttpSession session, Model model,@ModelAttribute("book") Book book ) {
    	Long userId =(Long) session.getAttribute("user_id");
    	User currentUser = userServ.findOne(userId);
    	if(userId == null) {
    		return "redirect:/";
       	}else {
    	model.addAttribute("user", currentUser);
    	return "addBook.jsp";
       	}
    }
//    create the book method for the user
    @RequestMapping(value="/createBook", method=RequestMethod.POST)
    public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result ) {
    	if(result.hasErrors()) {
    		return "addBook.jsp";
    	} else {
       		bookServ.createBook(book);
    		return "redirect:/home";
    	}
    }
//   show one book page
    @RequestMapping("/{id}/show")
	public String showBook(HttpSession session, @PathVariable("id") Long id, Model model) {
    	Long userId =(Long) session.getAttribute("user_id");
    	User currentUser = userServ.findOne(userId);
		Book book = bookServ.findBook(id);
	 	if(userId==null) {
    		return "redirect:/";
    	}else if(book==null){
    		return "redirect:/home";
    	}    	
    	else{
		model.addAttribute("user", currentUser);
		model.addAttribute("book", book);
		return "oneBook.jsp";
    	}
	}
    
//    edit entry page
    @RequestMapping("/{id}/editBook")
    public String edit(HttpSession session, @PathVariable("id") Long id, Model model) {
    	Long userId =(Long) session.getAttribute("user_id");
    	User currentUser = userServ.findOne(userId);
    	Book book = bookServ.findBook(id);
    	if(userId==null) {
    		return "redirect:/";
    	}else if( book == null || book.getUser().getId()!= userId){
    		return "redirect:/home";
    	}	else{
    		model.addAttribute("user", currentUser);
           	model.addAttribute("book", book);
        	return "editBook.jsp";
    	}
    	
    	
    	
    }
    
    
// edit entry method
    @RequestMapping(value="/{id}/editTheBook" , method=RequestMethod.PUT)
    public String editBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
    	if(result.hasErrors()) {
    		return "editBook.jsp";
    	} else {
    		System.out.println(book.getId());
    		System.out.println(book);
       		bookServ.updateBook(book);
       		
    		return "redirect:/home";
    	}
    }

    // delete book
    @RequestMapping(value="/{id}/deleteBook", method=RequestMethod.DELETE)
	 public String delete(@PathVariable("id") Long id) {
		 bookServ.deleteBook(id);
		 return "redirect:/home";
	 }
    
//    Book Broker DashBoard
    @RequestMapping("/bookBroker")
    public String bookBroker(HttpSession session, Model model) {
    	Long userId =(Long) session.getAttribute("user_id");
    	if(userId == null) {
    		return "redirect:/";
       	}else {
       		List<Book>borrowedBooks = userServ.findOne(userId).getBorrowedBooks();
       		List<Book> allBooks = bookServ.allBooks();
       		model.addAttribute("borrowedBooks", borrowedBooks);
       		model.addAttribute("allBooks", allBooks);
       		User currentUser = userServ.findOne(userId);
       		model.addAttribute("user",currentUser);
    	return "bookBroker.jsp";
       	}
    }
//    borrow book method
    @GetMapping("/{id}/borrow")
    public String borrowBook(@PathVariable("id") Long id,HttpSession session) {
    	Long userId =(Long) session.getAttribute("user_id");
    	Book borrowedBook = bookServ.findBook(id);
    	if(userId == null) {
    		return "redirect:/";
       	}else {
       		borrowedBook.setBorrower(userServ.findOne(userId));
       		bookServ.updateBook(borrowedBook);
       		return "redirect:/bookBroker";
       	}
    }
    
// Return the book
    @GetMapping("/{id}/return")
    public String returnBook(@PathVariable("id") Long id, HttpSession session) {
    	Long userId =(Long) session.getAttribute("user_id");
    	Book borrowedBook = bookServ.findBook(id);
    	if(userId == null) {
    		return "redirect:/";
       	}else {
       		borrowedBook.setBorrower(null);
       		bookServ.updateBook(borrowedBook);
       		return "redirect:/bookBroker";
       		
       	}
    }
    
    
    
    
}
