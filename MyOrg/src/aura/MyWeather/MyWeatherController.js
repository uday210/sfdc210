({
    doInit : function(component, event, helper) {
        // Get a reference to the getWeather() function defined in the Apex controller
		var action = component.get("c.getAccountWeather");
        action.setParams({
            "accountId": component.get("v.recordId")
        });
        // Register the callback function
        action.setCallback(this, function(response) {
            var data = JSON.parse(response.getReturnValue());
            // Set the component attributes using values returned by the API call
            if (data.current_observation) {
                component.set("v.currentWeather", data.current_observation);
                component.set("v.forecast", data.forecast);
            }
        });
        // Invoke the service
        $A.enqueueAction(action);
    }
    
})