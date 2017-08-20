public class sfdc7_page_ctrl {

    public List<Account> AllAccounts {get;set;}

    public sfdc7_page_ctrl (){
    
        AllAccounts  = new list<Account>();
        
        AllAccounts =[select Name,tackfield__c,Customer_Type__c from Account];
    
    }
}