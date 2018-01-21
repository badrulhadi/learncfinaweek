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
    <cfscript>
        variables.validMimeTypes =  {'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                                    ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
                                    ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx', application: 'PowerPoint (2007)'}
                                    ,'image/jpeg': {extension: 'jpg'}
                                    ,'image/png': {extension: 'png'}};
    </cfscript>

    <cftry>

        <cffile action="upload" filefield="uploadFile"
                destination="#GetTempDirectory()#" mode="600"
                accept="#StructKeyList(variables.validMimeTypes)#"
                strict="true"
                result="request.uploadResult"
                nameconflict="makeunique" />

    <cfcatch type="any">
        <!--- file is not written to disk if error is thrown  --->
        <!--- prevent zero length files --->
        <cfif FindNoCase("No data was received in the uploaded", cfcatch.message)>
            <cfabort showerror="Zero length file" />

        <!--- prevent invalid file types --->
        <cfelseif FindNoCase("The MIME type or the Extension of the uploaded file", cfcatch.message)>
            <cfabort showerror="Invalid file type" />

        <!--- prevent empty form field --->
        <cfelseif FindNoCase("did not contain a file.", cfcatch.message)>
            <cfabort showerror="Empty form field" />

        <!---all other errors --->
        <cfelse>
            <cfabort showerror="Unhandled File Upload Error" />

        </cfif>
    </cfcatch>
    </cftry>

    <!--- get actual mime type --->
    <cfset variables.actualMimeType = FileGetMimeType(request.uploadResult.ServerDirectory & '/' & request.uploadResult.ServerFile, true) />

    <!--- redundant check with strict="true", does not hurt to double check Adobe --->
    <cfif NOT StructKeyExists(variables.validMimeTypes, variables.actualMimeType)>
        <cffile action="delete" file="#request.uploadResult.ServerDirectory#/#request.uploadResult.ServerFile#"  />
        <cfabort showerror="Invalid file type (checked)" />
    </cfif>

    <!--- generate unique filename for move to destination, DO NOT reuse filename sent by user --->
    <cfset request.uploadFile.destination = ExpandPath("/") & "uploads/" & CreateUUID() & "." & variables.validMimeTypes[variables.actualMimeType]["extension"] />

    <cffile action="move"
            source="#request.uploadResult.ServerDirectory#/#request.uploadResult.ServerFile#"
            destination="#request.uploadFile.destination#" mode="644" />

</body>

</html>
