({
	myAction : function(component, event, helper) {
		var params = event.getParams('arguments');
        console.log(params.param1);
        console.log(params.param2);
	}
})