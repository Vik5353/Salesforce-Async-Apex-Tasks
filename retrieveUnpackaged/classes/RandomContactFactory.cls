public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(integer count, String s){
        List<Contact> contactList = new List<Contact>();
        for(Integer i=0; i<count; i++){
            Contact c = new Contact(firstName = s+' '+i, LastName = s);
            contactList.add(c);
        }
        return contactList;
    }
}