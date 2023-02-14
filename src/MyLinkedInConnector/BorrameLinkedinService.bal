package pacoLinkedinConnector;

import ballerina.net.http;
@http:BasePath ("/profile")
service ProfileInfoService {
    @http:POST
    resource postUpdate( message updateText) {

    }

    @http:PUT
    resource editPost( message editedPost) {

    }

    @GET
    resource getBasicProfile(message m) {
        Linkedin linkedinConnector = create Linkedin();
    }
}