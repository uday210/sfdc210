public class sfdc14_ctrl{

Public String externalData{get;set;}

    public sfdc14_ctrl(){
   //getMoneyConversion();
    }
    
    public void getData(){
    Account a = new Account();
    a.Name= 'my testing rest Acc';
    insert a;
    
        
       pulldata(); 
    
    }
    
    @future(callout=true)
    public static void pulldata(){
    
    
    
            
        HTTP h = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.myjson.com/bins/17anj1');
      // req.setEndpoint(System.Label.myExternalDataUrl);
        req.setMethod('GET');
        
        HttpResponse res = new HttpResponse ();
        
        res  = h.send(req);
        
        string externalData = res.getbody();
        
        Account accs = new Account();
        accs = (Account) System.JSON.deserialize(externalData , Account.class);


        System.debug(accs);
        
        integer countOfAccs = [select count() from Account where Name=:accs.Name];
        
        System.debug('>>>>>>>>>>>>>>>>>>> '+countOfAccs );
        if(countOfAccs  == 0){
        insert accs;
        }
        System.debug(accs);
        
    }
    
    
}