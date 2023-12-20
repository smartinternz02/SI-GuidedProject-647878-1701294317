@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        //System.assertEquals('https://th-apex-http-callout.herokuapp.com/animals/'+, req.getEndpoint());
        System.assertEquals('GET',req.getMethod());
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        
        res.setStatusCode(200);
        return res;
    }
}