public class RESTLimitResource {
    
    public static String JSONtext {get;set;}

    public RESTLimitResource() {
        JSONtext = getLimitsResp().getBody();
    }
 
    public static HttpResponse getLimitsResp() {
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');
       //String url = System.URL.getSalesforceBaseURL().toExternalForm() +'/services/data/v39.0/limits';
        String instanceurl = 'https://curious-raccoon-446736-dev-ed.my.salesforce.com';
        String url = instanceurl+'/services/data/v40.0/limits';
       
        req.setHeader('Authorization', 'OAuth ' + DoUserLogin());
        req.setEndpoint(url);
        return http.send(req);
    }
    
    
    public static String DoUserLogin() {
         HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('POST');
        String userName ='udaykiran.uday@curious-raccoon-446736.com';
        String Password_token = 'Bussas210@h7IYhhzK7fvVO5XvQhUGXQu1';
        String Body = '<?xml version="1.0" encoding="utf-8" ?><env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"><env:Body><n1:login xmlns:n1="urn:partner.soap.sforce.com"><n1:username>'+userName+'</n1:username><n1:password>'+Password_token+'</n1:password></n1:login></env:Body></env:Envelope>';
        req.setHeader('Content-Type', 'text/xml');
        req.setHeader('SOAPAction', 'test');
        req.setBody(Body);
        req.setEndpoint('https://login.salesforce.com/services/Soap/u/39.0');
        HttpResponse res=  http.send(req);
      return  res.getbody().split('<sessionId>')[1].split('</sessionId>')[0];
      // return '';
    }
}