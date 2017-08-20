public class ObjectPanelController {
    
    
    @AuraEnabled
    public static list<sObject> PullObjRecords(String objName,String ObjFields){
        
        String query = 'select '+ ObjFields+ ' from '+objName+' limit 10';
        return database.query(query);
    }

}