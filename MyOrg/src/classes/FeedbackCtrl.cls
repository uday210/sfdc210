/*
    This class is used for show sentiment score on page with diffrent colors.
    You can customize the logics and color according to your requirments.
*/
public class FeedbackCtrl{
   // public feedback__c fbck {get;set;}
   
   public Transient String userFb{get;set;}
    public string color{get;set;}
    public decimal score{get;set;}
    public list<listOfFbackwrapper> AllSentiments {get;set;}
     
    public FeedbackCtrl( ApexPages.StandardController controller ){
    userFb = '';
    AllSentiments  = new list<listOfFbackwrapper>();
    //    fbck = [ select id, Sentiment__c, Sentiment_Score__c from feedback__c where id =: controller.getRecord().id ];
        for(feedback__c   fbck : [ select id,feedback__c, Sentiment__c, Sentiment_Score__c from feedback__c where (Sentiment__c !='' AND Sentiment__c !=null) order by Name ASC] )
        {
        if( fbck.Sentiment__c == null || fbck.Sentiment_Score__c == null ){
            color='black';
            fbck.Sentiment_Score__c = 0;
            fbck.Sentiment__c = 'Somethign went wrong.';
            return;
        }
        
        color = '';
        score = math.abs(fbck.Sentiment_Score__c.setScale(2));
        fbck.Sentiment__c = fbck.Sentiment__c.capitalize();

        if( fbck.Sentiment__c.equalsIgnoreCase('negative') ){
            color='#bf0000';
        }
        else if( fbck.Sentiment__c.equalsIgnoreCase('slightly negative') ){
            color='#e48989';
        }
        else if( fbck.Sentiment__c.equalsIgnoreCase('positive') ){
            color='green';
        }
        else if( fbck.Sentiment__c.equalsIgnoreCase('slightly positive') ){
            color='#61bf61';
        }
        else if( fbck.Sentiment__c.equalsIgnoreCase('mixed') ){
            color='#afa100';
        }
        else if( fbck.Sentiment__c.equalsIgnoreCase('neutral') ){
            color='#e2e2e2';
        }
        AllSentiments.add(new listOfFbackwrapper(fbck.Sentiment__c ,color,score,fbck.feedback__c));
        }
    }
    
    
    
    public class listOfFbackwrapper{
    
        public String Sentiment {get;set;}
        public String color {get;set;}
          public decimal score {get;set;}
          public String feedback {get;set;}
        public listOfFbackwrapper(String Sentiment,String color,decimal score,String feedback){
            this.Sentiment = Sentiment;
            this.color = color;
            this.score = score;
            this.feedback = feedback;
        }
        
    }
    
    
    public pageReference dofeedBack(){
     feedback__c fdbck = new feedback__c();
      //  fdbck.email__c = email.fromAddress;
       // fdbck.subject__c = email.subject;
       
       if(userFb !=''){
        fdbck.feedback__c = userFb;
        insert fdbck;
       EMailHandler.scoreSentiments(fdbck.id);
        }
    
    
    return null;
    
    }
 
}