({
	doinit : function(component, event, helper) {
        
        var recVals = '';
		var action=component.get("c.pullAppProcess");
        action.setCallback(this,function(response){
            
           console.log(response.getReturnValue()); 
            
            for(var i=0;i<response.getReturnValue().length;i++){
             
                console.log(response.getReturnValue()[i].TargetObjectId);
                recVals+=response.getReturnValue()[i].TargetObjectId+',';
            }
            component.set("v.process",response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})