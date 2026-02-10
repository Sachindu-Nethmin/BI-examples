import ballerina/http;
import ballerina/io;
import ballerina/log;

public function main() returns error? {
    do {
        http:Response httpResponse = check stackoverflowClient->/questions.get(tagged = "ballerina", sort = "votes", 'order = "desc", pagesize = 5);
        json responsePayload = check httpResponse.getJsonPayload();
        io:println(responsePayload.toJsonString());
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
