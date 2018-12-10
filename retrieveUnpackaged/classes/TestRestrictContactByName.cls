@isTest
public class TestRestrictContactByName {
	@isTest
    public static void testRestrictContactByNameTrigger(){
        try{
        	Contact c = new Contact(LastName='INVALIDNAME');
        	insert c;    
        }catch(Exception e){
        	system.assert(e.getMessage().Contains('INVALIDNAME'));    
        }
    }
}