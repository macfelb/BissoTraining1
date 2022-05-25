public class Advisor extends Employee implements Authenticable {
    
    public List<Customer> customers;
    
    public Advisor() {
    
    }

    override
    public Decimal getBonus () {

        return this.salary * 1.5;

    }
    
    public Boolean login (String user, String password) {
        System.debug('Avisor super login '+ user + ' ' +password);
        return true;
    }

}