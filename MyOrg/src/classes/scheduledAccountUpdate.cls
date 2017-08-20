global class scheduledAccountUpdate implements Schedulable {
    global void execute(SchedulableContext SC) {
        list<Account> modifiedAccounts = new list<Account>();
        for(Account a:[SELECT Id,Dummy_Field__c FROM Account]){
        
            a.Dummy_Field__c = 'populated from Scheduler ';
            modifiedAccounts.add(a);
        
        }
        
        update modifiedAccounts;
    }
}