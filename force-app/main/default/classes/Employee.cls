public abstract class Employee {

    public String name;
    public String code;
    public Decimal salary;

    public void show () {
        System.debug(JSON.serialize( this ));
    }

    /*public virtual Decimal getBonus () {
        return this.salary * 1.2;
    }*/

    //now is mandatory override this method in the child class
    public abstract Decimal getBonus ();

}
