import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("about") { req in
        return "An IOS app that notifies a user of new movie releases. Users choose certain selection criteria and the user will then only be notified about new movies that meets the criteria. For example, a user selects a list of directors that they like. If a new movie is released that was directed by one of the directors in the user's list, the user is notified about the movie"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
