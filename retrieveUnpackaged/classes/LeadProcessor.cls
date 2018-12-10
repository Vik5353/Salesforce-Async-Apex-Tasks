public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc){
        String queryString = 'SELECT id,LeadSource FROM Lead';
    	return Database.getQueryLocator(queryString);    
    }
    public void execute(Database.BatchableContext bc,List<Lead> scope){
        List<Lead> leadList = new List<Lead>();
        for(Lead thisLead : scope){
            thisLead.LeadSource = 'Dreamforce';
            leadList.add(thisLead);
        } 
        if(!leadList.isEmpty()){
        	Database.update(leadList);    
        }
    }
    public void finish(Database.BatchableContext bc){}
}