({
 //   MAX_FILE_SIZE: 750 000, /* 1 000 000 * 3/4 to account for base64 */

    save : function(component,event,helper) {
        
        
       
    
        var fileInput = component.find("myFile").getElement();
    	var file = fileInput.files[0];
   		var helperis = helper;
         console.log(helper);
    
        var fr = new FileReader();
        console.log(fr);
          fr.readAsText(file);
     
       	fr.onload = function() {
            //alert();
            var fileContents = fr.result;
    	    var base64Mark = 'base64,';
            var dataStart = fileContents.indexOf(base64Mark) + base64Mark.length;
				console.log('fileContents');
          
            component.set('v.fileString',fileContents);
        	//helper.call(component);
    	 //  helper.upload(component, file, fileContents);
    	  var lines = fileContents.split("\r");
   for (var count = 0; count < lines.length; count++) {
    var tableRow = document.createElement('tr');
     var rowContent = lines[count].split(",");
       for (var i = 0; i < rowContent.length; i++) {
          var tableData = document.createElement('td');
		  var tableDataNode = document.createTextNode(rowContent[i].replace('_',','));
                        tableData.appendChild(tableDataNode);
                        tableRow.appendChild(tableData);

      
       }  
	   document.getElementById("data").appendChild(tableRow);
      
     } 
            

        };

      
    },
    
    startImport:function(component,event,helper) {
        
        
        console.log(component.get('v.fileString'));
        var fileContents = component.get('v.fileString'); 
        
        var allRecords = [];
        
         var lines = fileContents.split("\r");
        console.log(lines[0]);
        var headers = lines[0].split(',');
        console.log('headers',headers);
   for (var count = 1; count < lines.length-1; count++) {
       console.log('a');
       var eachRecord = {};
        var rowContent = lines[count].split(",");
       for (var i = 0; i < rowContent.length; i++) {
           console.log('b',headers[i]);
  				eachRecord[headers[i]] = rowContent[i];
       }
       	allRecords.push(eachRecord);
	   }
      
        
          var action = component.get("c.uploadRec"); 
		console.log('in upload');
        var attachId='';
        action.setParams({
            sObjectName: 'contact',
            dataPassed: JSON.stringify(allRecords)
          
        });

        action.setCallback(this, function(a) {
            console.log('in call back');
         
           console.log(a.getReturnValue());
            
         
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    });
    toastEvent.fire();

            
        });
            
       $A.enqueueAction(action); 
        
       
    }
        
   
})