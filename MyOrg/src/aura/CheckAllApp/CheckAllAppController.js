({
    doinit:function(component,event,helepr){
        //arrayAsObject
        console.log('in do init');
        component.set ("v.select_all_obj",[{'value':'1','prop':false},{'value':'2','prop':false},{'value':'3','prop':false},{'value':'4','prop':false},{'value':'5','prop':false}]);
        
        console.log( component.get ("v.select_all_obj"));
    },
	checkall : function(component, event, helper) {
		console.log(event.getSource().get("v.value"));
        component.set("v.select_all",event.getSource().get("v.value"));
	},
    checkallFromObj: function(component, event, helper) {
          //  console.log(event.getSource().get("v.value"));
           // component.set("v.select_all",event.getSource().get("v.value"));
           console.log( component.get ("v.select_all_obj").length);
         var all_vals = [];
        for(var i=0;i < component.get ("v.select_all_obj").length;i++){
            
            component.get ("v.select_all_obj")[i].prop = event.getSource().get("v.value");
           
            all_vals.push({'value':component.get ("v.select_all_obj")[i].value,'prop':event.getSource().get("v.value")});
            
       
        }
        component.set ("v.select_all_obj",all_vals);
	}
})