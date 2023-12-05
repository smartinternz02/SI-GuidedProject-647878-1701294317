@isTest
public class TestRestrictContactByName {
    @isTest
    static void testInvalidLastName() {
        Contact invalidContact = new Contact(LastName = 'INVALIDNAME');
        Test.startTest();
        try {
            insert invalidContact;
            // The insert should fail, so the code here shouldn't execute.
            System.assert(false, 'The insert should have thrown an error');
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('The Last Name "INVALIDNAME" is not allowed for DML'));
        }
        Test.stopTest();
    }

    @isTest
    static void testValidLastName() {
        Contact validContact = new Contact(LastName = 'Smith'); // Or any valid last name
        Test.startTest();
        try {
            insert validContact;
            // Ensure the insert is successful for a valid last name
            System.assertEquals(1, [SELECT COUNT() FROM Contact WHERE Id = :validContact.Id]);
        } catch (Exception e) {
            System.assert(false, 'No exception should be thrown for a valid last name');
        }
        Test.stopTest();
    }
}
