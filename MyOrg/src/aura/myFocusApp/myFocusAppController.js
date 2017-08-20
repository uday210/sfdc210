({
	doInit : function(cmp, event, helper) {
        setTimeout(function(){
              var el = cmp.find('middle');
            location.href = "#"+el.getGlobalId();
        },100);
        
        console.log(location);
		
	},
    
    submit : function(cmp,event,helper){
        var required_fields = ['name-input','name-input_lastName','name-input_email'];
        
        for(var i=0;i<required_fields.length;i++){
            if(cmp.find(required_fields[i]).get('v.value')=='' || cmp.find(required_fields[i]).get('v.value')==null){
            setTimeout(function(){ 
    		cmp.find(required_fields[i]).focus();
		}, 100);
                break;
            }
            
        }
    }
})