public class AddPrimaryContact implements Queueable {
    private Contact contactRecord;
    private String stateAbbreviation;

    public AddPrimaryContact(Contact contactRecord, String stateAbbreviation) {
        this.contactRecord = contactRecord.clone(false, false, false, false);
        this.stateAbbreviation = stateAbbreviation;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :stateAbbreviation LIMIT 200];

        List<Contact> contactsToInsert = new List<Contact>();
        for (Account acc : accounts) {
            Contact newContact = contactRecord.clone(false, false, false, false);
            newContact.AccountId = acc.Id;
            contactsToInsert.add(newContact);
        }
        insert contactsToInsert;
    }
}
