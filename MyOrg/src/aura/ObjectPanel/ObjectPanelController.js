({
	myAction : function(component, event, helper) {
        console.log('>>>> ');
		var action= component.get("c.PullObjRecords");
        
        action.setParams({
            objName:component.get("v.objectType"),
            ObjFields:component.get("v.fields")
        });
        action.setCallback(this,function(response){
            
            console.log('Hello',response.getReturnValue());
			component.set("v.records",response.getReturnValue());
			component.set("v.mystring",'uday');            
        });
        $A.enqueueAction(action);
	}
})