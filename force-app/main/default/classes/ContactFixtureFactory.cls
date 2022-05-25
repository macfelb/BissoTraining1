/**
 * @author Macfelb
 */

@isTest
public class ContactFixtureFactory {

    public static Contact newContact ( String lastName , Account account , City__c city ) {
        return new Contact ( LastName = lastName
                            , AccountId = account.Id
                            , City__c = city.Id
                            , Email = lastname.toLowerCase().replace(' ', '_')+ '@email.com');

    }

    public static Contact createContact ( String lastName , Account account , City__c city ) {
        return createContact ( newContact ( lastname , account , city ));
    }

    public static Contact createContact ( Contact contact ) {
        insert contact;
        return contact;
    }

    public static Map<String, SObject> createIntegratedScenario () {

        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        Account account = (Account) records.get('account');

        City__c city = (City__c) records.get('city');

        Contact contact = createContact('Marcos', account, city);

        records.put('contact', contact);

        return records;

    }

}