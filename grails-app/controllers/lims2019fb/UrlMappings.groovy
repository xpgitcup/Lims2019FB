package lims2019fb

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/indexLims2019fb")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
