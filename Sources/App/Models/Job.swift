//
//  Job.swift
//  App
//
//  Created by Luca Simone Gatta de Marinis on 10/06/2019.
//

import Foundation
import Vapor
import FluentPostgreSQL

final class Job: PostgreSQLModel {
  static let entity = "jobs"
  var id: Int?
  var order_id: Int?
  var book_id: Int
  var status: Int
  var publisher_code: String?
  var num_copies: Int
  var unit_price: Float?
  var cell_wrap: Bool?
  var customer_unit_price: Float?
  var customer_total_price: Float?
  var print_date: Date?
  var ship_date: Date?
  var created_at: Date?
  var updated_at: Date?

  init(order_id: Int,
       book_id: Int,
       status: Int,
       num_copies: Int,
       publisher_code: String?,
       unit_price: Float?,
       cell_wrap: Bool?,
       customer_unit_price: Float?,
       customer_total_price: Float?,
       print_date: Date?,
       ship_date: Date?,
       created_at: Date?,
       updated_at: Date?) {
    self.order_id = order_id
    self.book_id = book_id
    self.status = status
    self.num_copies = num_copies
    self.publisher_code = publisher_code
    self.unit_price = unit_price
    self.cell_wrap = cell_wrap
    self.customer_unit_price = customer_unit_price
    self.customer_total_price = customer_total_price
    self.print_date = print_date
    self.ship_date = ship_date
    self.created_at = created_at
    self.updated_at = updated_at
    
  }
}

extension Job: Content {}
extension Job: Parameter {}
//extension Job {
//  var book: Children<Job, Book> {
//    return children(\.book_id)
//  }
//}
