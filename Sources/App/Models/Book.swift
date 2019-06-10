import Foundation
import Vapor
import FluentPostgreSQL

final class Book: PostgreSQLModel {
  static let entity = "books"
  var id: Int?
  var isbn: String
  var title: String
  var subtitle: String?
  var author: String?
  var publication_date: Date?
  var format: String?
  var num_pages_bn: Int
  var num_pages_col: Int
  var setup: Int
  var cover_type: Int
  var cardboard_cover_type: Int?
  var soft_cover_paper: Int?
  var cover_grams: String
  var cover_lamination: Int?
  var flat_cover_print_cols: Int?
  var printed_flyleafs: Bool?
  var paper_type_bn: Int?
  var paper_type_col: Int?
  var paper_grams_bn: Int?
  var paper_grams_col: Int?
  var jacket_paper_type: Int?
  var jacket_lamination: Int?
  var legatures: String?
  var created_at: Date
  var updated_at: Date
  var publisher_id: IntegerLiteralType
  
  init(isbn: String,
       title: String,
       subtitle: String,
       author: String?,
       publication_date: Date?,
       format: String?,
       num_pages_bn: Int,
       num_pages_col: Int,
       setup: Int,
       cover_type: Int,
       cardboard_cover_type: Int?,
       soft_cover_paper: Int?,
       cover_grams: String,
       cover_lamination: Int?,
       flat_cover_print_cols: Int?,
       printed_flyleafs: Bool?,
       paper_type_bn: Int?,
       paper_type_col: Int?,
       paper_grams_bn: Int?,
       paper_grams_col: Int?,
       jacket_paper_type: Int?,
       jacket_lamination: Int?,
       legatures: String?,
       created_at: Date,
       updated_at: Date,
       publisher_id: Int) {
    self.isbn = isbn
    self.title = title
    self.subtitle = subtitle
    self.author = author
    self.publication_date = publication_date
    self.format = format
    self.num_pages_bn = num_pages_bn
    self.num_pages_col = num_pages_col
    self.setup = setup
    self.cover_type = cover_type
    self.cardboard_cover_type = cardboard_cover_type
    self.soft_cover_paper = soft_cover_paper
    self.cover_grams = cover_grams
    self.cover_lamination = cover_lamination
    self.flat_cover_print_cols = flat_cover_print_cols
    self.printed_flyleafs = printed_flyleafs
    self.paper_type_bn = paper_type_bn
    self.paper_type_col = paper_type_col
    self.paper_grams_bn = paper_grams_bn
    self.paper_grams_col = paper_grams_col
    self.jacket_paper_type = jacket_paper_type
    self.jacket_lamination = jacket_lamination
    self.legatures = legatures
    self.created_at = created_at
    self.updated_at = updated_at
    self.publisher_id = publisher_id
  }
}

extension Book: Content {}
extension Book: Parameter {}

