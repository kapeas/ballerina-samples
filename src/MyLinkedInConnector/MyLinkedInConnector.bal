import ballerina.lang.jsons;
import ballerina.lang.messages;
import ballerina.lang.system;
import ballerina.net.http;

connector Linkedin(string oauthAccessToken) {

    http:ClientConnector linkedinConnector = create http:ClientConnector("https://api.linkedin.com/v1/");

    action getPeople(Linkedin lic)(message ) {

        string peoplePath = "people/~?oauth2_access_token={YOUR_TOKEN_HERE}&format=json";
        message request = {};
        message response = http:ClientConnector.get(linkedinConnector, peoplePath, request );
        return response;
    }

    action postUpdate(Linkedin lic, string textToPost)(message) {
        json payload= `{ "comment": "Ballerina 101 Introduction to ballerina lang. By Francisco Serrano. An IGZ API Program session. #InCodeWeTrust", "visibility" : {"code" : "anyone"} }`;
        message request = {};
        messages:setJsonPayload(request, payload);
        string peoplePath="people/~/shares?oauth2_access_token=AQXMkAp_oJ4Ej5ZUv6axvN6t8UsDvAmj1cbbekPhUGuN1Kd00HdOd37BtJZP3YkL9OTMiynFTpnhk5OMyFfaftyAKJS3MuBrZ4N6jPmXtV-JtMi6rVFIalTx4Jqf8SVyP0MwjZRf5vGLQNIAbSQKbUCpbfDvXjHfXnbTJF6g7spfPLPeCQo&format=json";
        message response = http:ClientConnector.post(linkedinConnector, peoplePath, request);
        return response;
    }

}



function main(string[] args) {
    Linkedin liConnector = create Linkedin(args[0]);
    message liResponse = Linkedin.getPeople(liConnector);
    message liResponse2 = Linkedin.postUpdate(liConnector,"");
    json peopleJSONResponse = messages:getJsonPayload(liResponse);
    system:println(jsons:toString(peopleJSONResponse));
}
