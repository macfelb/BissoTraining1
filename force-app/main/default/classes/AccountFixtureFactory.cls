@isTest

public class AccountFixtureFactory {
    
        public static Account newAccount ( String name, CNAE__c cnae, City__c city ) {

            Account account = newAccount(name, cnae);
            account.BillingCity__c = city.Id;
            return account;

        }

        public static Account createAccount ( String name, CNAE__c cnae, City__c city ) {

            return createAccount ( newAccount(name, cnae, city));

        }

        public static Account newAccount ( String name, CNAE__c cnae ) {

            Account account = newAccount(name);
            account.Cnae__c = cnae.Id;
            return account;

        }

        public static Account createAccount ( String name, CNAE__c cnae ) {

            return createAccount ( newAccount ( name, cnae ));

        }

        public static Account newAccount ( String name ) {

            return new Account ( Name = name
                                , BillingCountry = 'Brasil'
                                , BillingStreet = 'Rua do Teste'
                                , BillingState = 'São Paulo'
                                );
        }


        public static Account createAccount ( String name ) {
            return createAccount ( newAccount(name) );
        }

        public static Account createAccount (Account account) {
            insert account;
            return account;
        }

        public static Map<String, SObject> createIntegratedScenario () {
            
            Map<String, SObject> records = new Map<String, SObject> ();
            
            Cnae__c cnae = CnaeFixtureFactory.createCnae ('12345');

            records.put('cnae', cnae);

            City__c city = CityFixtureFactory.createCity('São Paulo', '1234567');

            records.put('city', city);

            Account account = AccountFixtureFactory.createAccount('Teste', cnae, city);

            records.put('account', account);

            return records;

        }
}