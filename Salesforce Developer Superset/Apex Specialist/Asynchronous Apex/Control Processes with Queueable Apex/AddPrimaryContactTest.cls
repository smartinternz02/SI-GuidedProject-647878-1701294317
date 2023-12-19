@IsTest
private class AddPrimaryContactTest {
    @TestSetup
    static void setup() {
        List<Account> accountsNY = new List<Account>();
        List<Account> accountsCA = new List<Account>();

        for (Integer i = 0; i < 50; i++) {
            accountsNY.add(new Account(Name = 'Test Account NY ' + i, BillingState = 'NY'));
            accountsCA.add(new Account(Name = 'Test Account CA ' + i, BillingState = 'CA'));
        }
        insert accountsNY;
        insert accountsCA;
    }

    @IsTest
    static void testQueueable() {
        List<Account> accountsCA = [SELECT Id FROM Account WHERE BillingState = 'CA' LIMIT 50];

        Contact testContact = new Contact(LastName = 'Test', FirstName = 'Contact');
        AddPrimaryContact queueableJob = new AddPrimaryContact(testContact, 'CA');

        Test.startTest();
        System.enqueueJob(queueableJob);
        Test.stopTest();

        Integer insertedContactsCount = [SELECT COUNT() FROM Contact WHERE AccountId IN :accountsCA];
        System.assertEquals(50, insertedContactsCount, 'Expected number of contacts were not inserted for CA Accounts.');
    }
}
