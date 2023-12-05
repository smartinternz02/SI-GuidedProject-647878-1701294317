public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lastName) {
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 1; i <= numberOfContacts; i++) {
            String firstName = 'Test ' + i;
            Contact newContact = new Contact(
                FirstName = firstName,
                LastName = lastName
            );
            contacts.add(newContact);
        }
        return contacts;
    }
}
