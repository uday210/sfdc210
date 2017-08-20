global class GenereicRecordPuller{



@AuraEnabled
public static list<sObject> PullRecords(String sObjectName){

if(sObjectName !='' && sObjectName!=null){

return database.query('select Id, name from '+ sObjectName+ '  Order by lastmodifiedDate DESC Limit 10');
}

return null;
}

}