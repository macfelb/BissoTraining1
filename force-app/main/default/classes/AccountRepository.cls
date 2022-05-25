/**
 * @author macfelb - May/11/2022
 */

public virtual class AccountRepository {

    public virtual List<Account> findByCountry (String country) {
        return [SELECT Id
                    , Name
                    , BillingStreet
                    , BillingCity
                    , BillingCountry
                FROM Account
                WHERE BillingCountry = :country];
    }

    virtual 
    public List<Account> findByContactByName (String name) {
        return [SELECT Id
                    , Name
                    , BillingStreet
                    , (SELECT ID 
                            , Name
                            , Email
                        FROM Contacts
                        WHERE Email != null)
                FROM Account
                WHERE Name = :name];
    }

    virtual
    public List<Account> findWithContactsByCnaeCode (String cnaeCode) {
        return [SELECT Id, Name, Cnae__c, BillingStreet, BillingCity
                    , (SELECT Id, Name, Email FROM Contacts WHERE Email != null)
                FROM Account
                WHERE CNAE__r.CNAECode__c = :cnaeCode ];
    }

    virtual
    public Account findById (String id) {

        List<Account> accounts = [SELECT Id 
                                        ,Name
                                        ,CNAE__c
                                        ,BillingStreet
                                        ,BillingCity
                                    FROM Account
                                    WHERE ID = :id];
        return accounts.isEmpty() ? null : accounts.get(0); 
    
    }

    virtual
    public Account findByCnaeCode (String cnaeCode) {

        List<Account> accounts = [ SELECT Id
                                        , Name
                                        , CNAE__c
                                        , CNAE__r.Description__c
                                        , BillingStreet
                                        , BillingCity
                                    FROM Account
                                    WHERE 
                                        CNAE__r.CNAECode__c = :cnaeCode];
        
        return accounts.isEmpty() ? null : accounts.get(0);

    }

    /* Inicalmente o Bisso criou esse método assim, porém depois explicando a parte de teste ele melhorou o método
    public Account create ( Account account ) {
        insert account;
        return account;
    }   */

    public Account create ( Account account ) {
        create ( new List<Account> {account} );
        return account;
    }

    public List<Account> create ( List<Account> accounts ) {
        insert accounts;
        return accounts;
    }    

    public Account save ( Account account ) {
        save (new List<Account> {account});
        return account;
    }

    public List<Account> save ( List<Account> accounts ) {
        update accounts;
        return accounts;
    }    

    public void remove ( Account account ) {
        delete account;
    }

}