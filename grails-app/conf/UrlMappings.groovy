class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")

//      DEFINE A PÁGINA INICIAL DO SISTEMA
//        "/" {
//            controller = "carro"
//            action = "index"
//        }


        "500"(view:'/error')
	}
}
