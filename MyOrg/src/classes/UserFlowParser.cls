public class UserFlowParser {

    public class userAccessParser {
        public String access_token{get;set;}
        public String refresh_token{get;set;}
        public String signature{get;set;}
        public String scope{get;set;}
        public String id_token{get;set;}
        public String instance_url{get;set;}
        public String id{get;set;}
        public String token_type{get;set;}
        public String issued_at{get;set;}
    }

    
    public static userAccessParser parse(String json) {
        return (userAccessParser) System.JSON.deserialize(json, userAccessParser.class);
    }
}