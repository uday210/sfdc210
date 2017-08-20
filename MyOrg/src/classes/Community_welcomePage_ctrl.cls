public class Community_welcomePage_ctrl extends Community_baseCtrl{


   public  Community_welcomePage_ctrl (){
   
       super('www.welcomepage.com');
       
       System.debug('>>>>><<<<< '+Base_url );
       System.debug(Community_publicUrl());
   }
   
   
   
   
   public void get_base_data(){
   
       System.debug(get_page_url());
       
   }
    

}