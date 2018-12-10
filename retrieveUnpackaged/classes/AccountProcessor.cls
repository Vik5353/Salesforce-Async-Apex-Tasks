/***** Future Apex ******/
public class AccountProcessor {
	@future
    public static void countContacts(List<ID> accountIDs){
        Map<string,Integer> contactCount = new Map<string,Integer>();
        List<Account> accountRecords = new List<Account>();
        for(Contact thisContact : [SELECT id,AccountID FROM Contact WHERE AccountID IN: accountIDs]){
            if(contactCount.containsKey(thisContact.AccountId)){
                Integer i = contactCount.get(thisContact.AccountId) + 1;
                contactCount.put(thisContact.AccountId,i);
            }else{
                contactCount.put(thisContact.AccountId,1);
            }
        }
        system.debug('contactCount '+contactCount);
        for(Account thisAccount : [SELECT Id,Number_of_Contacts__c FROM Account WHERE ID IN: accountIDs]){
            if(contactCount.containsKey(thisAccount.id)){
            	thisAccount.Number_of_Contacts__c = contactCount.get(thisAccount.id);
                accountRecords.add(thisAccount);
            }
        }
        system.debug('account Records '+accountRecords);
        if(!accountRecords.isEmpty()){
            Database.update(accountRecords);
        }
    }
}