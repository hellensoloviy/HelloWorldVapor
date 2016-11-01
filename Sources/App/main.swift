import Vapor

let drop = Droplet()

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}

drop.get("hello") { request in
    return "Hello, world!"
}

//drop.get("login") { request in
//    return "Hello, world!"
//}

drop.get("version") { request in
    return try JSON(node: [
        "version": "1.0"
        ])
}


drop.get("/hello",":name") { request in
    if let name = request.parameters["name"]?.string {
        return "Hello \(name)!"
    }
    return "Error retrieving parameters."
}

//drop.get("/login",":login",":pass") { request in
//    if let name = request.parameters["login"]?.string, name == "Hellen" {
//        
//        if let pass = request.parameters["pass"]?.string, pass == "112233" {
//            return try JSON(node: [
//                "login": "\(name)",
//                "pass": "\(pass)",
//                "token": "sfdslsdawsef233esf454trdgd"
//                ])
//        } else {
//            return try JSON(node: [
//                "status": "403",
//                "error": "Wrong password!"
//                ])
//        
//        }
//
//  
//    }
//    return try JSON(node: [
//        "status": "404",
//        "error": "User not found!"
//        ])
//}

drop.resource("posts", PostController())

drop.run()
