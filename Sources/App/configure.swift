import Leaf
import FluentPostgreSQL
//import PostgreSQL
import Vapor
// import DatabaseConnectionCache
import DatabaseKit

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
  
  // Register providers first
  try services.register(FluentPostgreSQLProvider())

  // Register routes to the router
  let router = EngineRouter.default()
  try routes(router)
  services.register(router, as: Router.self)

  
  let psqlconfig = PostgreSQLDatabaseConfig(hostname: "localhost",
                                            port: 5432,
                                            username: "loop",
                                            database: "the_fac_development",
                                            password: nil,
                                            transport: .cleartext)
  let postgres = PostgreSQLDatabase(config: psqlconfig)
  var databases = DatabasesConfig()
  databases.add(database: postgres, as: .psql)
  databases.enableLogging(on: .psql)
  
  services.register(databases)

  //config.prefer(MemoryKeyedCache.self, for: KeyedCache.self)
  // services.register(DatabaseConnectionCache.self)
  
  // Register providers first
  try services.register(LeafProvider())

  // Use Leaf for rendering views
  config.prefer(LeafRenderer.self, for: ViewRenderer.self)

  // Register middleware
  var middlewares = MiddlewareConfig() // Create _empty_ middleware config
  middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
  middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
  services.register(middlewares)
  Book.defaultDatabase = .psql
  Job.defaultDatabase = .psql
}
