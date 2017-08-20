@isTest
public class sfdc9_page_ctrl_Test{


    public static testMethod void testMethod1() {
    
    sfdc9_page_ctrl SPC = new sfdc9_page_ctrl();
    
    SPC.Add_row();
    SPC.remove_row();
    SPC.LoadTheseAccounts[0].Name= 'test';
    SPC.save_records();
    SPC.Add_row();
    SPC.Add_row();
    SPC.Add_row();
    SPC.Add_row();
    SPC.Add_row();
    
    
    
    }


}