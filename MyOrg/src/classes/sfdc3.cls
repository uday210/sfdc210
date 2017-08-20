public class sfdc3{



    public sfdc3(){
    
    
    }
    
    
    public void fetchAccounts(){
    
           list<Account> AllAccounts = new list<Account>();
    
            AllAccounts =  [select id,Name from Account];
            
            System.debug(AllAccounts);
             System.debug(AllAccounts.size());
    }
    
    
    
    
    public void fetchAccounts(Integer limitOfRecords){
    
           list<Account> AllAccounts = new list<Account>();
    
            AllAccounts =  [select id,Name from Account limit :limitOfRecords];
            
            System.debug(AllAccounts);
             System.debug(AllAccounts.size());
    }
}