public class ApprovalProcess{



@AuraEnabled
public static list<sObject> pullAppProcess(){


return [SELECT CompletedDate, CreatedById, CreatedDate,Id,IsDeleted,LastActorId,
LastModifiedById,LastModifiedDate,ProcessDefinitionId,Status,SubmittedById
,SystemModstamp,TargetObjectId,TargetObject.Name, (SELECT ID, ProcessNodeId, StepStatus,
Comments,TargetObject.Name,ActorId,CreatedById,IsDeleted,IsPending,
OriginalActorId,ProcessInstanceId,RemindersSent,CreatedDate 
FROM StepsAndWorkitems ) FROM ProcessInstance];
}
    
    
@AuraEnabled
    public static map<String,String> getRecordIdandName(map<String,String> ObjectNameAndRecordIds){
       // List<String> Allids = listofRecords.split(',');
        
      //  for(sObject each:[select ])
        
     return null;   
    }
}