/**
 * @author macfelb - macfelb cloud solution
 */

public class Customer implements Authenticable {
    
    public String name;
    public String code;
    public String billingStreet;
    public String billingCity;
    public String billingState;

    public Customer () {

    }

    public Customer (String code) {
        this.code = code;
    }

    public Customer (String code, String name) {
        this.code = code;
        this.name = name;
    }

    /*
    *According with Bisso, clean code is to have at least up to 3 params in the overloading;
    * Also, constructor take in consideration
    * type
    * order of parameters (like string, integer, string)
    * number of params
    */
    
    
    public void show () {
        
        System.debug(JSON.serialize (this));
   
    }

    public Boolean login (String user, String password) {
        System.debug('Customer super login ' + user + ' ' +password);
        return true;
    }

}