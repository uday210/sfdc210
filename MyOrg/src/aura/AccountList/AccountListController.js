({
	doInit : function(component, event, helper) {
        var action = component.get('c.getAccounts');
        
        action.setCallback(this,function(response){
            var state= response.getState();
            if(state= 'SUCCESS')
            {
                component.set("v.accounts",response.getReturnValue());
                
            }
        });
		$A.enqueueAction(action);
	}
})