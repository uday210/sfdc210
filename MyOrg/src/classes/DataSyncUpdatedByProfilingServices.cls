@RestResource(urlMapping='/updateSyncResults/*')
global class DataSyncUpdatedByProfilingServices{


@HttpPost
global static string updateAccounts(){

     //Get te Request From the Rest Context
     RestRequest request = RestContext.request;
     
     //Remove unwanted Spaces from The String if Any
     String jSONRequestBody=request.requestBody.toString().trim();  

     //Parse The Json Passed as String In nRequestBody
     String RecordsNeedToBeUpdated = PartnerPortalRequestParser.parse(jSONRequestBody).recordsList.replace('\'','"');
     
     //Create A new List<sObjects> as we donr Know Whch object records we Get 
     list<sObject> PassedListObject = new  list<sObject>();
     
     //instantiate The Salesforce Object class like Account.class or User.class Based On the 'updateFor' Parameter in passed Json
     Type t = Type.forName('list<'+PartnerPortalRequestParser.parse(jSONRequestBody).updateFor+'>.class');

     //Parse The Records String into List<sObject> and Deserialize as above class
     PassedListObject= (list<sObject>)JSON.deserialize(RecordsNeedToBeUpdated ,t);
  
    //Update The Results
     SYstem.debug(Database.update(PassedListObject,false));

  return 'success' ;
}





}