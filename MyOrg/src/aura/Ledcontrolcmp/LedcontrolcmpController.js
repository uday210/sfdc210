({
	doClick : function(component, event, helper) {
        var sel = component.find('led').get("v.value");
         var action = component.get("c.switch_led"); 
       // console.log(if(sel)?'on':'off');
        var act = sel?'on':'off';
        console.log(act);
       action.setParams({
            action: act          
        });

        action.setCallback(this, function(a) {
           
            console.log(a.getReturnValue());
            
        });
            
       $A.enqueueAction(action); 
       
		
	}
})