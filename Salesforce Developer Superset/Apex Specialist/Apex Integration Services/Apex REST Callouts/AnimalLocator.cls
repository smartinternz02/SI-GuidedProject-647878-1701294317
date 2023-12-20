public class AnimalLocator {
    public static String getAnimalNameById(Integer idParam) {
        Http httpClass = new Http();
        httpRequest httpRequestClass = new httpRequest();
        httpRequestClass.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + idParam);
        httpRequestClass.setMethod('GET');
        httpResponse response = httpClass.send(httpRequestClass);
        
        Map<String, Object> resultMap = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
        Map<String, Object> animal = (Map<String, Object>) resultMap.get('animal');
            return (String)animal.get('name');
    }
}