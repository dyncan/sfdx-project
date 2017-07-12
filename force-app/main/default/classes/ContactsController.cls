public with sharing class ContactsController {
  public ContactsController() {
  }
   @RemoteAction
    public static List<Contact> GetContacts(){
        List<Contact> contacts = [select id, Name from contact LIMIT 50];

        return contacts;
    }
    @RemoteAction
    public static Contact GetContact(String contactId){
        Contact contact = [SELECT Id, Name, Email FROM Contact WHERE Id =: contactId];

        return contact;
    }
    @RemoteAction
    public static void UpdateContact(String contactId, String email){
            Contact contact = [SELECT Id, Name FROM Contact WHERE Id =: contactId];
            contact.Email = email;
            update contact;
    }
    @RemoteAction
    public static void NewContact(String firstName, String lastName, String email){
        Contact newContact = new Contact(FirstName = firstName, LastName = lastName, Email = email);
        insert newContact;
    }
    @RemoteAction
    public static void DeleteContact(String contactId){
            Contact contact = [SELECT Id FROM Contact WHERE Id =: contactId];
            delete contact;
    }
}
