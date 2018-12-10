/***** Future Apex ******/
@isTest
public class AccountProcessorTest {
    @isTest
    public static void testSingle(){
        Account acc1 = new Account(Name = 'myTestAccount'); 
        insert acc1;
        Contact con1 = new Contact(LastName = 'myTestContact', AccountId = acc1.id);
        insert con1;
        Contact con2 = new Contact(LastName = 'myTestContact', AccountId = acc1.id);
        insert con2;
        test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc1.id});
        test.stopTest();
    }
    @isTest
    public static void testSingleNegative(){
        Account acc1 = new Account(Name = 'myTestAccount'); 
        insert acc1;
        
        test.startTest();
        AccountProcessor.countContacts(new List<Id>{acc1.id});
        test.stopTest();
    }
    @isTest 
    public static void testMultiple(){
    	List<account> accList = new List<account>();
        List<contact> conList = new List<contact>();
        List<id> accIds = new List<id>();
        for(Integer i=0; i<200; i++){
            Account accountRec = new Account(Name='acc '+i);
            accList.add(accountRec);
        }
        if(!accList.isEmpty()){
        	Database.SaveResult[] sr = Database.insert(accList);
            if(!sr.isEmpty()){
                for(Integer i=0; i<200; i++){
                	Contact conRec = new Contact(LastName='Con '+i,AccountID=sr[i].id);    
                    conList.add(conRec);
                    accIds.add(sr[i].id);
                }    
            }
            if(!conList.isEmpty()){
                Database.insert(conList);
            }
        }
        
        test.startTest();
        	AccountProcessor.countContacts(accIds);
        test.stopTest();
    }
}