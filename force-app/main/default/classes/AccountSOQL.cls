/**
 * @author macfelb May/05/2022
 */

public class AccountSOQL {
    
    public AccountSOQL() {

    }

    public void findAccountByBillingCountry (String country) {

        List<Account> accounts = [SELECT  Id
                                    , Name 
                                    FROM Account
                                    WHERE BillingCountry = :country];
        System.debug(JSON.serialize(accounts));

    }

}