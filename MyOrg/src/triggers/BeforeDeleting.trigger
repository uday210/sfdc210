trigger BeforeDeleting on Account (before delete) {
	
    for(Account a:Trigger.old){
        
       // if(a.id=='00128000010lAyV')
        if(a.id=='00128000018AG40'){
            
            a.addError('please dont delete this Account');
        }
    }
}