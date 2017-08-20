public class sfdc1{
    
        //this is constructure
        public sfdc1(){
            
            System.debug('Hello SFDC');
        }
        
        //Simple method
        
        public void sayHello(String username,Integer age){
        
            System.debug('hello '+username+', youe age is '+age);
        }
        
        public void sayBye(){
        
            System.debug('Bye uday');
        }
        
        public void callsfdc2(){
        
        
            sfdc2 classins = new sfdc2();
            
            classins.hellosandeep();
        }
        
        
        public integer addNumbers(integer a,integer b){
        
        
        return a+b;
        }
        
        public void sayhellotoall(list<String> allstudents){
        
            
            for(String eachStudent:allstudents){
            
            System.debug('Hello '+eachStudent);
            
            }
        
        }
        
        public void callAccount(){
        
        System.debug([select id,name from Account]);
        }
    
    
    }