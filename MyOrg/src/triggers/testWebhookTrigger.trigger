trigger testWebhookTrigger on Account (before insert) {

    String url = 'https://echo-webhook.herokuapp.com/bussa';

    String content = Webhook.jsonContent(Trigger.new, Trigger.old);

    Webhook.callout(url, content);

}