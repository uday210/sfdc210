({
   
    
    upload: function(component, file, fileContents) {
        var action = component.get("c.saveTheFile"); 
		console.log('in upload');
        var attachId='';
        action.setParams({
            parentId: '0012800001QJH0p',
            fileName: file.name,
            base64Data: encodeURIComponent(fileContents), 
            contentType: file.type
        });

        action.setCallback(this, function(a) {
            console.log('in call back');
            console.log(a);
            attachId = a.getReturnValue();
            console.log(attachId);
            alert(attachId);
        });
            
       $A.enqueueAction(action); 
       
         
     },

})