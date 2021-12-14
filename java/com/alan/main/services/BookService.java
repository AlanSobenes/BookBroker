package com.alan.main.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.alan.main.models.Book;
import com.alan.main.repositories.BookRepository;
@Service
public class BookService {
//	----------------DEPENDENCY INJECTION----------------
    // adding the book repository as a dependency
    private final BookRepository bookRepository;
    
    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }
//    -------------------------------------------------
    // returns all the books
    public List<Book> allBooks() {
        return bookRepository.findAll();
    }
    // creates a book
    public Book createBook(Book b) {
        return bookRepository.save(b);
    }
    // retrieves a book
    public Book findBook(Long id) {
        Optional<Book> optionalBook = bookRepository.findById(id);
        if(optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }
    //	updates a book
    public Book updateBook(Book b) {
    	return bookRepository.save(b);
    }
    
    // delete a Book by Id
    public void deleteBook(Long id) {
        	 bookRepository.deleteById(id);      
         }
    
    
}
