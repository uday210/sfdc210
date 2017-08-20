public class sfdc13_ctrl{

Public String currencyConversionData{get;set;}

    public list<myWrapperClass> myData {get;set;} 
    
    public String BasePrice {get;set;}

    public sfdc13_ctrl(){
   //getMoneyConversion();
    }
    
    public void getMoneyConversion(){
    
        HTTP h = new HTTP();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.fixer.io/latest?base='+BasePrice);
        req.setMethod('GET');
        
        HttpResponse res = new HttpResponse ();
        
        res  = h.send(req);
        
        currencyConversionData = res.getbody();
        
    
    }
    
    
    public class myWrapperClass{
        
        public String Name {get;set;}
        public String Age {get;set;}
        public myWrapperClass(String Name,String Age){
            this.Name = Name;
            this.Age = Age;
        
        }
    }
}