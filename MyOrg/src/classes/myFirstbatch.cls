global class myFirstbatch Implements Database.Batchable<sObject> {

    global Database.queryLocator start(Database.BatchableContext bc) {
        String SOQL = 'SELECT Id,Dummy_Field__c FROM Account';
        return Database.getQueryLocator(SOQL);
    }

    global void execute(Database.BatchableContext bc, List<Account> scope) {
    
        list<Account> modifiedAccounts = new list<Account>();
        for(Account a:scope){
        
            a.Dummy_Field__c = 'populated from Batch ';
            modifiedAccounts.add(a);
        
        }
        
        update modifiedAccounts;
    
    }

    global void finish(Database.BatchableContext bc) {
    
    
    }
}