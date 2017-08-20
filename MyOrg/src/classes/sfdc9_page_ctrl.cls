public class sfdc9_page_ctrl {
    
    public list<Account> LoadTheseAccounts {get;set;}
    
    
    public Boolean showRemoveButton{get;set;}
    public Boolean showAddButton{get;set;}

    public sfdc9_page_ctrl(){
    showRemoveButton = false;
    showAddButton = true;
    LoadTheseAccounts = new list<Account>();
    
    LoadTheseAccounts.add(new Account());
    
  
    }
    
    
    
    public void save_records(){
    
            insert LoadTheseAccounts;
            
            LoadTheseAccounts = new list<Account>();
            LoadTheseAccounts.add(new Account());
    }
    
    public void Add_row(){
    
          LoadTheseAccounts.add(new Account());
          
          if(LoadTheseAccounts.size()>1){
                  showRemoveButton = true;
                  
                  if(LoadTheseAccounts.size()==5){
                      showAddButton = false;
                  }
          }
          
          
         
    
    
    }
    
    
    public void remove_row(){
    
        LoadTheseAccounts.remove(LoadTheseAccounts.size()-1);
        if(LoadTheseAccounts.size()==1){
          showRemoveButton = false;
          }
          
          if(LoadTheseAccounts.size()<5){
                      showAddButton = true;
                  }
    
    }
}