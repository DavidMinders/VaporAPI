//
//  TMDBServicesController.swift
//  App
//
//  Created by David Minders on 4/30/19.
//

import Foundation
import Vapor

final class TMDBSrvicesController {
    
    func getNowPlayingMovies(req: Request) throws -> Future<Movies> {
        
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=" +
        "1dd73c1835723ced334a4cbc5061c2d1&language=en-US&page=1&region=us"
        
        let client = try req.make(Client.self)
        let answer = client.get(popularMoviesURL).flatMap { apiResponse in
            return try apiResponse.content.decode(Movies.self)
        }
        
        return answer
    }
}

struct Movie: Codable, Content {
    var posterPath: String?
    var movieID: Int?
    var movieTitle: String?
    var overview: String?
    var releaseDate: String?
    var rating: Double?
    
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case movieID = "id"
        case movieTitle = "title"
        case overview = "overview"
        case releaseDate = "release_date"
        case rating = "vote_average"
    }
}

struct Movies: Codable, Content {
    let results: [Movie]
}
