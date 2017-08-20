({
	doinIt : function(component, event, helper) {

        var action = component.get("c.getCasesDB");
        
        action.setCallback(this,function(response){
            
            component.set("v.cases",response.getReturnValue());
        });
        
        $A.enqueueAction(action);
	}
})