@isTest
public class myContactTrigger{


    public static  testmethod  void mytestMethod(){
    
    Contact c = new Contact();
    c.firstName = 'test';
    c.lastName = 'test';
    c.Email= 'test@test.com';
    insert c;
    
    c.Email = 'test@asdf.com';
    update c;
    
    }
}