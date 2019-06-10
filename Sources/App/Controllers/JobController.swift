//
//  JobController.swift
//  App
//
//  Created by Luca Simone Gatta de Marinis on 10/06/2019.
//


import Foundation
import Vapor

final class JobController {
  func index(_ req: Request) throws -> Future<[Job]> {
    return Job.query(on: req).all()
  }
  // func create(_ req: Request) throws -> Future<[Book]> {
  //   return try req.content.decode(Book.self).flatMap { book in
  //      return book.save(on: req)
  //   }
  //}
}
