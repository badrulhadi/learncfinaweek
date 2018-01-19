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
    <!--- <p>
        ColdFusion is running and you have successfully copied over the files to your web root!
    </p> --->

    <cffile 
        action="upload" 
        destination="/vagrant" 
        filefield="aFile"
        nameconflict="makeunique"
        accept="image/png"	
        result="fileUploadResult" />

    <cfscript>
        
    </cfscript>
</body>

</html>