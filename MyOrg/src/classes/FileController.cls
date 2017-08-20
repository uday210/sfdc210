public class FileController {
    
    @AuraEnabled
    public static String saveTheFile(String parentId, String fileName, String base64Data, String contentType) { 
        System.debug(parentId);
        System.debug(fileName);
        System.debug(base64Data);
        System.debug(contentType);
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = new Attachment();
        a.parentId = parentId;

        a.Body = EncodingUtil.base64Decode(base64Data);
        a.Name = fileName;
        a.ContentType = contentType;
        
       // insert a;
        
       // return a.Id;
       return a.Body.toString();
    }
    
    
    @AuraEnabled
    public static String uploadRec(String sObjectName, String dataPassed) { 
    
    
        list<sObject> PassedListObject = new  list<sObject>();
     
    Type t = Type.forName('list<'+sObjectName+'>.class');
    

     //Parse The Records String into List<sObject> and Deserialize as above class
     //PassedListObject= (list<sObject>)JSON.deserialize(JSON.serialize(dataPassed) ,t);
     PassedListObject= (list<sObject>)JSON.deserialize(dataPassed,t);
     
     
     insert PassedListObject;
     
     return 'success';
    }
}