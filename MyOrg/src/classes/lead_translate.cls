public class lead_translate {

public lead ld{get;set;}

public lead_translate (){

string idis = ApexPages.currentpage().getparameters().get('id');

ld = [select id,Postal_Company_Name__c,Postal_Address_1__c,Postal_Address_2__c,Postal_County__c,Postal_City__c,Postal_State__c from lead where id = : idis ];

}


public pagereference translate(){

    //String text = '你好！你好吗';
//String text = '云技术大中华区';
//String text = 'パートナー取引先';

//String idis = '00Q2800000hCp2z';
//lead ld = [select id,Postal_Company_Name__c,Postal_Address_1__c,Postal_Address_2__c,Postal_County__c,Postal_City__c,Postal_State__c from lead where id = : idis ];
String text = ld.Postal_Company_Name__c+','+ld.Postal_Address_1__c+','+ld.Postal_Address_2__c+','+ld.Postal_County__c+','+ld.Postal_City__c+','+ld.Postal_State__c;
HttpRequest req = new HttpRequest();
string key = 'AIzaSyBgMtT98pfkjpw-MXRW7QY090ErgF8O4FM';
Http http = new Http();

string url = 'https://www.googleapis.com/language/translate/v2?key='+key+'&target=en&q=' + text;

req.setMethod('GET');

req.setEndPoint(url);

HTTPResponse resp = http.send(req);

//System.debug( resp.getBody());

Map<String,Object> rawObj = (Map<String,Object>) JSON.deserializeUntyped(resp.getBody());
System.debug(rawObj.get('data'));
//System.debug(rawObj.get('data').get('translations'));

//System.debug(rawObj.get('data').get('translations').get('translatedText'));
 
return null;
}



}