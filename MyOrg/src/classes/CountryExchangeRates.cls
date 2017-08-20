public class CountryExchangeRates {
    
    @AuraEnabled
    public static map<String,Object> getCurrenyRate(String BaseCountry){
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://api.fixer.io/latest?base='+BaseCountry);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        
       return (map<String,Object>)JSON.deserializeUntyped(res.getBody());
        
        
    }

}