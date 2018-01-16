<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>
    <h1>
        Congratulations!!
    </h1>
    <p>
        ColdFusion is running and you have successfully copied over the files to your web root!
    </p>

    <cfset Greeting = CreateObject("Component", "Greeting") />
    <cfset myGreeting = Greeting.getGreeting(firstName="Emily", lastName="Christiansen") />
  
    <cfoutput>
        #myGreeting#
    </cfoutput>
    
    <cfscript>
        // myQry = new Query();
        // myQry.setDatasource("learncfinaweek"); 
        // myQry.setSQL("SELECT * FROM category");
        // myQuery = myQry.execute();

        // writeDump(myQuery.getResult());
        // writeDump(myQuery.getPrefix());

        // myQueryResult = new Query(
        //     sql="SELECT * FROM resume", 
        //     datasource="learncfinaweek"

        // ).execute().getResult();

        // myQueryResult = QueryExecute(
        //     ("SELECT * FROM resume"),
        //     {datasource="learncfinaweek"}
        // );

        // writeDump(myQueryResult);
    </cfscript>
</body>

</html>