({
	doInit : function(component, event, helper) {
        
        var obj = component.get("v.objectName");
        var Action = component.get("c.PullRecords");
        Action.setParams({
            sObjectName:obj
        });
        Action.setCallback(this,function(response){
            
           component.set("v.recList" ,response.getReturnValue());
        });
        $A.enqueueAction(Action);
	}
})