public class sfdc6_page_ctrl {

    public Account acc{get;set;}

    public sfdc6_page_ctrl (){
    
        acc = new Account();
    }
    
    public void save_acc(){
    
        insert acc ;
        
         acc = new Account();
    
    }
}