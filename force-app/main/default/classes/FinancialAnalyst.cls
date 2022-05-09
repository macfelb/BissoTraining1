public class FinancialAnalyst extends Employee {

    public String financialTool;

    /**
     * public override Decimal getBonus () {
     *   return this.salary * 1.2 + 25000;
     *}
     * DRY - don't repeat yourself
     * If you need to repead an operation that main class already implements you can use the reserved word
     * SUPER + method to execute what you have there
     */
    
     public override Decimal getBonus () {

        //return super.getBonus () + 25000;
        return ( this.salary * 1.2 ) + 25000;
     }

}
