component {

    this.name = "learncfinaweek";
    this.datasource = "learncfinaweek";
    this.applicationnTimeOut = CreateTimeSpan(10, 0, 0, 0);
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes

    function onApplicationStart(){
        application.myName = "Badrul Hadi";
        application.myPosition = "Developer";
        application.utilities = CreateObject('cfc.utilities');
        return true;
    }

    function onRequestStart(string tsrgetPage){
        if (StructKeyExists(URL, 'load')){
            onApplicationStart();
        }
    }
}