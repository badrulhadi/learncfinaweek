component {

    this.name = "learncfinaweek";
    this.datasource = "learncfinaweek";
    this.applicationnTimeOut = CreateTimeSpan(10, 0, 0, 0);
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes
    this.mappings = {
        "/adminCustomTags" = expandPath('/learncfinaweek/www/admin/customtags')
    };
    this.ormEnabled = true;
    this.ormSettings = {
                    logsql = true,
                    dbcreate="update",
                    cfclocation="com/entity"
                    };
    this.invokeImplicitAccessor = true;

    this.sessioncookie.httponly = true;
    this.sessioncookie.timeout = "10";
    this.sessioncookie.disableupdate = true;

    function onApplicationStart(){
        application.myName = "Badrul Hadi";
        application.myPosition = "Developer";
        application.utilities = CreateObject('cfc.utilities');
        return true;
    }

    function onRequestStart(string tsrgetPage){
        if (StructKeyExists(URL, 'load')){
            onApplicationStart();
            ormReload();
        }
    }
}
