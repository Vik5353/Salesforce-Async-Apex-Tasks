@isTest
public class LeadProcessorTest {
	@isTest
    public static void testSingle(){
        Lead lead1 = new Lead(LastName = 'myTestLead', Company = 'myTestLead'); 
        insert lead1;
        test.startTest();
        	LeadProcessor lp = new LeadProcessor();
        	Database.executeBatch(lp);
        test.stopTest();
    }
    @isTest 
    public static void testMultiple(){
        List<Lead> leadList = new List<Lead>();
        for(Integer i=0; i<200; i++){
        	Lead lead1 = new Lead(LastName = 'myTestLead '+i, Company = 'myTestLead '+i); 
        	leadList.add(lead1); 
        }
        if(!leadList.isEmpty()){
            insert leadList;
        }
        test.startTest();
        	LeadProcessor lp = new LeadProcessor();
        	Database.executeBatch(lp);
        test.stopTest();
    }
}