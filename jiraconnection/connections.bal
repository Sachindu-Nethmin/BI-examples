import ballerinax/jira;

final jira:Client jiraClient = check new ({
    auth: {
        token: "<your-jira-api-token>"
    }
});
