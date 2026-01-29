import ballerina/http;
import ballerinax/jira;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function post issue() returns error|json {
        do {
            jira:CreatedIssue jiraCreatedissue = check jiraClient->/api/'3/issue.post({
                fields: {
                    "project": {
                        "key": "<project key>"
                    },
                    "summary": "For Testing1",
                    "description": "Test issue",
                    "issuetype": {
                        "name": "idea"
                    }

                }
            }
, updateHistory = false);
            jira:IssueBean jiraIssuebean = check jiraClient->/api/'3/issue/[string `<issue id>`].get(fieldsByKeys = false, updateHistory = false, failFast = false);
            return jiraIssuebean.toJson();

        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}
