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

    <cfset artists = entityLoad( "artist", { firstname: "Jeff" }, "lastname" )>
    <cfset artists = ormExecuteQuery(
        "FROM artist WHERE firstname like :firstname ORDER BY lastname", 
        { firstname: "A%"}
        )>
    
    <cfoutput>
    <cfloop array="#artists#" index="artist">
        <h4>#artist.firstName# #artist.lastname# #artist.id#</h4>
        <cfif artist.hasArt()>
            <ul>
                <cfloop array="#artist.getArt()#" index="art">
                    <li>#art.name# #dollarFormat( art.price )#</li>
                </cfloop>
            </ul>
        </cfif>
    </cfloop>
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