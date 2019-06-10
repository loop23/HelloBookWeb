//
//  BookController.swift
//  App
//
//  Created by Luca Simone Gatta de Marinis on 10/06/2019.
//

import Foundation
import Vapor

final class BookController: RouteCollection {
  
  func boot(router: Router) throws {
    let booksRoute = router.grouped("api", "books")
    booksRoute.get(use: getAllHandler)
    booksRoute.get(Book.parameter, use: getOneHandler)
    booksRoute.post(use: createHandler)
    booksRoute.put(Book.parameter, use: updateHandler)
    booksRoute.delete(Book.parameter, use: deleteHandler)
  }
  
  func createHandler(_ req: Request) throws -> Future<Book> {
    return try req.content.decode(Book.self).flatMap { (book) in
      return book.save(on: req)
    }
  }
  
  func getAllHandler(_ req: Request) throws -> Future<[Book]> {
    return Book.query(on: req).decode(Book.self).all()
  }
  func getOneHandler(_ req: Request) throws -> Future<Book> {
    return try req.parameters.next(Book.self)
  }

  func updateHandler(_ req: Request) throws -> Future<Book> {
    return try flatMap(to: Book.self, req.parameters.next(Book.self), req.content.decode(Book.self)) { (book, updatedBook) in
      book.isbn = updatedBook.isbn
      book.num_pages_bn = updatedBook.num_pages_bn
      return book.save(on: req)
    }
  }

  func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
    return try req.parameters.next(Book.self).flatMap { (book) in
      return book.delete(on: req).transform(to: HTTPStatus.noContent)
    }
  }
    
  func index(_ req: Request) throws -> Future<[Book]> {
    return Book.query(on: req).all()
  }
 // func create(_ req: Request) throws -> Future<[Book]> {
 //   return try req.content.decode(Book.self).flatMap { book in
//      return book.save(on: req)
 //   }
  //}
}
