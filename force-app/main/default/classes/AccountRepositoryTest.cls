/**
 * @author macfelb
 */

@isTest
public class AccountRepositoryTest {

    @isTest
    public static void givenAccountWithBillingCountryWhenFindAccountByBillingCountryThenReturnAccountWithBillingCountry () {

        //Test below will return 0 because when start test the database is empty
        System.debug(JSON.serialize([SELECT Id FROM Account]));

        //given
        /* Instead of use the call below to create data, use a fixtureFactory class

        Account account = new Account();
        account.Name = 'Test de Account';
        account.BillingCountry = 'Brasil';
        account.BillingStreet = 'Rua do Test';
        account.BillingState = 'São Paulo';

        insert account;*/

        Account account = AccountFixtureFactory.createAccount('Test do Marcos');  


        //when
 
        AccountRepository repository = new AccountRepository();

        Test.startTest();

        List<Account> accounts = repository.findByCountry('Brasil');

        Test.stopTest();


        //then
        System.assert(!accounts.isEmpty());

        System.assertEquals(1, accounts.size());

        Account storedAccount = accounts.get(0);

        System.assertEquals(account.Id, storedAccount.Id);

        System.assertEquals(account.BillingCountry, storedAccount.BillingCountry);

    }

    @isTest
    public static void givenAccountWithCnaeWhenFindByCnaeCodeThenReturnAccount () {

        //given

        /* replaced by fixturefactory class
        CNAE__c cnae = new CNAE__c();
        cnae.CNAECode__c = '12345';
        cnae.Description__c = 'Test do CNAE';

        insert cnae;

        Account account = new Account();
        account.Name = 'Test de Account';
        account.BillingCountry = 'Brasil';
        account.BillingStreet = 'Rua do Test';
        account.BillingState = 'São Paulo';
        account.Cnae__c = cnae.Id;

        insert account; */

        CNAE__c cnae = CnaeFixtureFactory.createCnae ( '12345' );

        Account account = AccountFixtureFactory.createAccount('Teste', cnae);


        //when
        AccountRepository repository = new AccountRepository();

        Test.startTest();

        Account storedAccount = repository.findByCnaeCode('12345');

        Test.stopTest();


        //then
        System.assert(storedAccount != null);
        System.assertEquals(account.Id , storedAccount.Id);
        System.assertEquals(account.CNAE__c , storedAccount.CNAE__c);

    }

 /*   @isTest
    public static void givenAccountWithContactWhenSearchByContactWithEmailNotNullThenRerturnAccount () {

    }*/

    @isTest
    public static void givenValidAccountWhenCreateThenReturnAccountWithId () {
        
        //Account account = AccountFixtureFactory.newAccount('Test');
        Account account = AccountFixtureFactory.newAccount('Test');

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        Account storedAccount = repository.create(account);

        Test.stopTest();

        System.assert(storedAccount.Id != null);

    }

    @isTest
    public static void givenCreatedAccountWhenSaveThenReturnChangedAccount () {
        
        //Account account = AccountFixtureFactory.newAccount('Test');
        Account account = AccountFixtureFactory.createAccount('Test');

        account.Name = 'Test 2';

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        Account storedAccount = repository.save(account);

        Test.stopTest();

        System.assertEquals(account.Name, storedAccount.Name);

    }

    @isTest
    public static void givenCreatedAccountWhenFindByIdThenReturnStoredAccount () {

        Account account = AccountFixtureFactory.createAccount('Test');

        AccountRepository repository = new AccountRepository();

        Test.startTest();

        Account storedAccount = repository.findById(account.Id);

        Test.stopTest();

        System.assertEquals(account.Id, storedAccount.Id); 

    }

    @isTest
    public static void givenAccountWithContactWhenFindAccountWithContactByCnaeCodeThenReturnAccountWithContact () {

        Map<String, SObject> records = ContactFixtureFactory.createIntegratedScenario ();

        AccountRepository repository = new AccountRepository();

        Cnae__c cnae = (Cnae__c) records.get('cnae');

        Test.startTest();

        List<Account> storedAccounts = repository.findWithContactsByCnaeCode(cnae.CnaeCode__c);

        Test.stopTest();

        System.assert(!storedAccounts.isEmpty());

        System.assertEquals(1, storedAccounts.size());

        List<Contact> contacts = storedAccounts.get(0).contacts;

        System.assert(!contacts.isEmpty());

        System.assertEquals(1, contacts.size());    

    }

    @isTest
    public static void givenAccountWithContactWhenFindAccountByNameThenReturnAccountWithContact () {

        Map<String, SObject> records = ContactFixtureFactory.createIntegratedScenario ();

        AccountRepository repository = new AccountRepository();

        Account account = (Account) records.get('account');

        Test.startTest();

        List<Account> storedAccounts = repository.findByContactByName(account.Name);

        Test.stopTest();

        System.assert(!storedAccounts.isEmpty());

        System.assertEquals(1, storedAccounts.size());

        List<Contact> contacts = storedAccounts.get(0).contacts;

        System.assert(!contacts.isEmpty());

        System.assertEquals(1, contacts.size()); 

    }

    @isTest
    public static void givenExistentAccountWhenSelectedToBeDeletedThenAccountDeleted () {
        
        Account account = AccountFixtureFactory.createAccount('Test');
        
        AccountRepository repository = new AccountRepository();

        Test.startTest();

        System.debug('FALSE ' + [SELECT Id
                    FROM Account
                    WHERE IsDeleted = FALSE
                    AND Id = :account.Id
                    ALL ROWS]);

        System.debug('TRUE ' + [SELECT Id
                    FROM Account
                    WHERE IsDeleted = TRUE
                    AND Id = :account.Id
                    ALL ROWS]);

        repository.remove(account);

        Account accountDeleted = [SELECT Id
                                FROM Account
                                WHERE IsDeleted = true
                                    AND Id = :account.Id
                                    ALL ROWS];

        System.assertEquals(account.Id, accountDeleted.Id);

        System.debug('FALSE ' + [SELECT Id
                    FROM Account
                    WHERE IsDeleted = FALSE
                    AND Id = :account.Id
                    ALL ROWS]);

        System.debug('TRUE ' + [SELECT Id
                    FROM Account
                    WHERE IsDeleted = TRUE
                    AND Id = :account.Id
                    ALL ROWS]);

        Test.stopTest();

    }

}