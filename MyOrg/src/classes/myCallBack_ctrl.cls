public class myCallBack_ctrl{

    public String CodeIs{get;set;}
    public   UserFlowParser.userAccessParser acc {get;set;}
    
    public String ResBody{get;set;}
    public myCallBack_ctrl(){
        ResBody = '';
        acc = new  UserFlowParser.userAccessParser();
    
        CodeIs =ApexPages.currentPage().getParameters().get('code');
        DOget_AccessToken(CodeIs );
    }
    
    
    public void DOget_AccessToken(String CodeIs ){
    
                
                    Http h = new Http();
            HttpRequest req  =new HttpRequest();
            req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
            req.setMethod('POST');
            //req.setHeader('content-type','x-www-form-urlencoded');
            String payLoad = 'grant_type=authorization_code&code='+CodeIs +'&client_id=3MVG9ZL0ppGP5UrCcerwBt6gwGsEF6WZxZJsNGCZW8VTHjU9XVPQ9LF4Zm9qKEv9lJbuj5.RDvpphvjHBfPUP&client_secret=409772059413415945&redirect_uri=https://uday210new-developer-edition.ap2.force.com/myCallBack';
            req.setBody(payLoad);
            HttpResponse res = h.send(req);
            System.debug(res);
            System.debug(res.getBody());
            ResBody = res.getBody();
           // AccessParserUtil.AccessParser acc = new  AccessParserUtil.AccessParser();
            acc = UserFlowParser.parse(res.getBody());
            
            System.debug(acc);
    }
}