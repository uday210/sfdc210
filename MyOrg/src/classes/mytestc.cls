@RestResource(urlmapping='/mytestresr/*')
global class mytestc{


    @HttpPost
    global static Integer myPostMethod(){
    
         RestRequest req = RestContext.request;

    Particle__c pc = new Particle__c();
    pc.Request_data__c = req.requestBody.toString();
 
    insert pc;
   
    return 1;

    }
    
    @HttpGet
    global static Integer myGetr(){

    return 10;

    }


}