public class IOT{




@Auraenabled
public static string switch_led(String action){

    
 Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String access_token = '627adcd776daf5bf68df5f5399c2587c28f9cb41';
     //   String dataString = 'grant_type=password&username=udaykiran.uday@gmail.com&password=Bussas210#';
        String url = 'https://api.particle.io/v1/devices/4a0044000f51353532343635/led';
        request.setEndPoint(url);
        request.setMethod('POST');
request.setHeader('Authorization','Bearer '+access_token);
request.setHeader('Content-Type','application/x-www-form-urlencoded');
request.setBody( 'arg='+action );

        HttpResponse response = httpProtocol.send(request);
System.debug(response.getBody());
return response.getBody();

}

}