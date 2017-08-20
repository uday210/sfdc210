trigger OrderEventTrigger on Order_Event__e (after insert) {

    system.debug(trigger.new);
    
     List<Task> tasks= new List<Task>();
     
    // Get queue Id for case owner

    User myuser= [SELECT Id FROM user WHERE isActive=true limit 1];

        

    // Iterate through each notification.

    for (Order_Event__e event : Trigger.New) {

        if (event.Has_Shipped__c== true) {

            // Create Case to dispatch new team.

            Task tk  = new Task();

            tk.priority = 'Medium';

            tk.status= 'New';

            tk.OwnerId = myuser.Id;
            tk.subject  = 'Follow up on shipped order ' + event.Order_Number__c;

            tasks.add(tk);

        }

   }
insert tasks;
}