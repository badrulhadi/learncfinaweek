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

    <cfset FruitBasket = {} />
    <cfset FruitBasket["Apple"] = "Like" />
    <cfset FruitBasket["Banana"] = "Like" />
    <cfset FruitBasket["Cherry"] = "Dislike" />

    <cfdump var = "#FruitBasket#" />

    <cfset myArray = ['Jeff', 'John', 'Steve', 'Julianne'] />

    <cfscript>
        for (test in myArray) {
            writeOutput(#test# & '<br />');
        }
    </cfscript>
    

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

        myQueryResult = queryExecute(
            "SELECT * FROM resume",
            {dbType:"query"}
        );

        writeDump(myQueryResult);
    </cfscript>
</body>

</html>