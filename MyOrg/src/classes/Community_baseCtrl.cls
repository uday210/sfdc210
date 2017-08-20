/*****************************************
** this is a base class for Community all the controller should extend this class
** this class pulls all the respective Custom metadata and custom settings and recordtye detail
** as we have multiple communities every community Base controller shoul dimplement 'Community_config_intf' interface
** 
**********************************************************/

public Abstract class Community_baseCtrl {

    public String Base_url ;
    
    public user user_data ;
    Sales_community ss;
    public list<String> Community_config {get;set;}

    public Community_baseCtrl(){
    
        ss = new Sales_community ();
       Community_config  =  ss.get_community_config();
    
        Base_url = 'www.sfdc.com';
        
        user_data  = [select id,firstName,LastName,Email from User where id=:Userinfo.getUserid()];
        
    }
    
    //over loaded constructure
     public Community_baseCtrl(String PassedUrl){
    
        Base_url = PassedUrl;
    }
    
    
    public Community_baseCtrl(String communityName,Integer a){
    user_data  = [select id,firstName,LastName,Email from User where id=:Userinfo.getUserid()];
    
         Type t = Type.forName(communityName);
         
         Community_config_intf CCF =(Community_config_intf) t.newInstance();
         Community_config  = CCF.get_community_config();

    }
    
    public virtual  String Community_publicUrl(){
    
        return 'www.sfdc_open.com';
    }
    
    
    public virtual String get_page_url(){
    
        return Base_url.toUppercase();
    }
    
    
    
    public virtual User get_userInfo(){
    
        return user_data;
    }
    
    
   
}