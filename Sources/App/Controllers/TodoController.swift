import Vapor

/// Controls basic CRUD operations on `Todo`s.
final class TodoController {
    /// Returns a list of all `Todo`s.
    func index(_ req: Request) throws -> Future<[Todo]> {
        return Todo.query(on: req).all()
    }

    /// Saves a decoded `Todo` to the database.
    func create(_ req: Request) throws -> Future<Todo> {
        return try req.content.decode(Todo.self).flatMap { todo in
            return todo.save(on: req)
        }
    }

    /// Deletes a parameterized `Todo`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Todo.self).flatMap { todo in
            return todo.delete(on: req)
        }.transform(to: .ok)
    }
    
//    func getNowPlayingMovies(req: Request) throws -> Future<Movie> {
//        let apiKey = "1dd73c1835723ced334a4cbc5061c2d1"
//
//    let searchURLString = String("https://api.themoviedb.org/3/movie/now_playing?api_key=" +
//    "\(apiKey)&language=en-US&page=1&region=us")
//
//        let client = try req.make(Client.self)
//        let response = client.get(searchURLString) { response in
//            return try response.content.decode(Movie.self)
//        }
//
//        return response.flatMap { model in
//            let all = Movies(results: Movie)
//            return Future.map(on: req) {
//                return all }
//        }
//    }
}
