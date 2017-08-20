({
	showFor : function(component, event, helper) {
		var selectedItem = event.target;
         console.log('data Name = ',  selectedItem.dataset.id);
          var myEvent = $A.get("e.c:Globalclick");
     
        myEvent.setParams({"data": selectedItem.dataset.id});
        
		myEvent.fire();
        
        
        
       // component.set("v.showAcc",false);


	}
})