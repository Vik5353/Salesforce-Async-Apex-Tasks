@isTest
public class TestVerifyDate {
	@isTest
    public static void testCheckDates_Positive(){
    	VerifyDate.CheckDates(system.today(),system.today());    
    }
    @isTest
    public static void testCheckDates_Negative(){
    	VerifyDate.CheckDates(system.today(),system.today()+32);    
    }
}