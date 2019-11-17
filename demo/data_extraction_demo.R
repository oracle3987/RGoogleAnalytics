require(RGoogleAnalytics)

# Authorize the Google Analytics account
# This need not be executed in every session once the token object is created 
# and saved
token <- Auth(client.id,client.secret)

# Save the token object for future sessions
save(token,file="./token_file")

# In future sessions it can be loaded by running load("./token_file")

ValidateToken(token)

# Build a list of all the Query Parameters
query.list <- Init(start.date = "2013-11-28",
                   end.date = "2020,12-28",
                   dimensions = "ga:date,ga:pagePath,ga:hour,ga:medium",
                   metrics = "ga:sessions,ga:pageviews",
                   max.results = 1000000,
                   sort = "-ga:date",
                   table.id = "ga:330936332")

# Create the Query Builder object so that the query parameters are validated
ga.query <- QueryBuilder(query.list)

# Extract the data and store it in a data-frame
ga.data <- GetReportData(ga.query, token, daywise = T, delay = 5)
# true token to access funds to own account .
