trigger MyFrstTgr on Account(before update,after update){




if(trigger.isAfter){

System.debug('After trigger');
System.debug('trigger.new'+trigger.new);
System.debug('trigger.old'+trigger.old);

Account a = [select id from account limit 1];
a.addError('this is error from trigger');
if(utlityclass.state())
update a;

}


if(trigger.isBefore){

System.debug('After trigger');
System.debug('trigger.new'+trigger.new);
System.debug('trigger.old'+trigger.old);

Account a = trigger.new[0];
a.addError('this is error');
}

}