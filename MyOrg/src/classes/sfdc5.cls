public class sfdc5{

    Public String name{get;set;}
    
    public Integer a{get;set;}
    public Integer b{get;set;}
    
    public Integer sum{get;set;}

   
    
    public void sayHello(){
    
    
    
    }
    
    public void addNumbers(){
     sum = a+b;
    
    }
    
    
    public Pagereference pg{get;set;}
    
    
     public sfdc5(){
    
        a=0;
        b=0;
        sum = 0;
    
        name = 'SFDC';
        
        pg = new Pagereference('/apex/hello_uday');
    }
    public void changePage(){
    
    pg =  new Pagereference('/apex/hello_udayNew');
    
    }



}