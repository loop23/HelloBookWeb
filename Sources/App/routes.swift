import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  
  let booksController = BookController()
  try router.register(collection: booksController)

  // "It works" page
  router.get { req in
    return try req.view().render("welcome")
  }
    
  // Says hello
  router.get("hello", String.parameter) { req -> Future<View> in
    return try req.view().render("hello", [
      "name": req.parameters.next(String.self)
    ])
  }
  
  let jobController = JobController()
  router.get("jobs", use: jobController.index)
  //  router.post("meals", use: mealController.create)
}
