public class AccessParserUtil {
    public AccessParserUtil() {}
    
    public class AccessParser {
        public String access_token{get;set;}
        public String instance_url{get;set;}
        public String id{get;set;}
        public String token_type{get;set;}
        public String issued_at{get;set;}
        public String signature{get;set;}
    }

    
    public static AccessParser parse(String json) {
        return (AccessParser) System.JSON.deserialize(json, AccessParser.class);
    }
}