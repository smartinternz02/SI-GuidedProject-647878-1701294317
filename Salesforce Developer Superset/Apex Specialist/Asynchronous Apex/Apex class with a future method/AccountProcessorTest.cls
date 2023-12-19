// AccountProcessorTest.cls
@isTest
public class AccountProcessorTest {
    @isTest
    static void testCountContacts() {
        // Test data setup
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Contact con1 = new Contact(LastName = 'Smith', AccountId = acc.Id);
        Contact con2 = new Contact(LastName = 'Johnson', AccountId = acc.Id);
        insert new List<Contact>{con1, con2};

        List<Id> accIds = new List<Id>{acc.Id};

        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();

        Account updatedAcc = [SELECT Number_Of_Contacts__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(2, updatedAcc.Number_Of_Contacts__c);
    }
}
