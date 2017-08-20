@RestResource(urlMapping='/slackResourse/*')
global  class slackResourse {
   
    @HttpGet
    global static void getRecord() {
    
        // Add your code
        
        RestRequest request = RestContext.request;
        
        system.debug('>>>>>>>>> '+request );

        RestContext.response.addHeader('Access-Control-Allow-Origin', '*');
        Account Acc = [select id,name From Account limit 1];
        RestContext.response.responseBody = Blob.valueOf(JSON.serialize([select name,Phone from Account where name=:request.params.get('text')]));
      
     // return '<h1>'+Acc.Name+'</h1>';
     
     //return JSON.serialize(request.params.get('text'));
     
    // return '{"text": "Accounts matching"}';
    

        
      //  return 'pretty' ;
      
    }
    
    
    public class data{
    
        public String Name{get;set;}
        public String Accid{get;set;}
    
    
        public data(String Name,String Accid){
            this.Name  = Name;
            this.Accid = Accid;
        
        }
    
    
    }
       
}