trigger myContactTrigger on Contact (before insert,after insert,before update,after update) {

    if(Trigger.isBefore){
        
        if(Trigger.isInsert){
            System.debug('Hi this is a before insert action');
            System.debug(trigger.new[0]);
           
        }
        if(Trigger.isUpdate){
            
            System.debug('Hi this is a before update action');
            System.debug(trigger.old[0]);
            System.debug(trigger.new[0]);
            
            if(trigger.old[0].Email != trigger.new[0].Email){
               myUtilityClass.sendEmail(trigger.new[0].Email); 
            }
            
            
        }
        
    }
    if(Trigger.isAfter){
       
        if(Trigger.isInsert){
            System.debug('Hi this is a after insert action');
             System.debug(trigger.new[0]);
            
        }
        if(Trigger.isUpdate){
            
        }
        
    }
    
    

}