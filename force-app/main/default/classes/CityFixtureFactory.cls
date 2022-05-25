/**
 * @author macfelb
 */

@isTest
public class CityFixtureFactory {

    public static City__c newCity ( String name, String ibgeCode ) {
        return new City__c ( Name__c = name
                            , IbgeCode__c = ibgeCode);
    }

    public static City__c createCity ( String name, String ibgeCode ) {
        return createCity ( newCity ( name , ibgeCode ) );
    } 

    public static City__c createCity ( City__c city ) {
       
        insert city;
       
        return city;
   
    }

}