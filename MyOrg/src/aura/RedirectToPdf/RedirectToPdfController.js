({
	Pdf : function(component, event) {
    var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": "/apex/my_pdf"
              
            });
            urlEvent.fire();        
}
})