component {

    this.base_greeting = "Hello, ";
    // variables.base_greeting = "Hello, ";

    public string function getFullName (String firstName, String lastName) {

        var fullName = arguments.firstName & ' ' & arguments.lastName;
        
        return fullName;
    }

    public string function getGreeting (String firstName, String lastName) {

        var full_name = getFullName(argumentCollection=arguments);
        var greeting = this.base_greeting & full_name;
        // var greeting = variables.base_greeting & full_name;        

        return greeting;
    }
}
