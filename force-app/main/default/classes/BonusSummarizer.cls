public class BonusSummarizer {
    
    public Decimal totalBonus;
    
    public BonusSummarizer() {
        this.totalBonus = 0;
    }

    public void addBonus (Employee employee) {
        this.totalBonus += employee.getBonus();
    }

    public void showBonus () {
        System.debug( 'Total of Bonus ' + this.totalBonus);
    }
}
