({
  doInit : function(component, event, helper) {
    helper.getAccounts(component);
    helper.getContacts(component);
    helper.getLeads(component);
  },
    handleGblClick :function(component, event, helper) {
        console.log('hello');
        console.log(event.getParams().data);
        if(event.getParams().data == 'Accounts'){
            
            component.set("v.showAcc",true);
             component.set("v.showCon",false);
             component.set("v.showLead",false);
        }
		else 
        if(event.getParams().data == 'contacts'){
            
            component.set("v.showAcc",false);
             component.set("v.showCon",true);
             component.set("v.showLead",false);
        }else 
        if(event.getParams().data == 'Leads'){
            
            component.set("v.showAcc",false);
             component.set("v.showCon",false);
             component.set("v.showLead",true);
        }else{
            
            
             component.set("v.showAcc",true);
             component.set("v.showCon",true);
             component.set("v.showLead",true);
        }
        
    }
})