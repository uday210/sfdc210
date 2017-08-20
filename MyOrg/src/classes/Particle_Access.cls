public class Particle_Access{



public void Particle_token(){


 Http httpProtocol = new Http();
        HttpRequest request = new HttpRequest();
        String dataString = 'grant_type=password&username=udaykiran.uday@gmail.com&password=Bussas210#';
        String url = 'https://api.spark.io/oauth/token';
        request.setEndPoint(url);
        request.setMethod('POST');
request.setHeader('Authorization','Basic cGFydGljbGU6cGFydGljbGU=');
request.setBody( dataString );

        HttpResponse response = httpProtocol.send(request);
System.debug(response.getBody());
        
}



}