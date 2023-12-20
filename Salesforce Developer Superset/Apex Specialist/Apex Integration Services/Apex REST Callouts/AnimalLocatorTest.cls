@isTest
public class AnimalLocatorTest {
    @isTest
    public static void testMethod1(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        AnimalLocator.getAnimalNameById(2);
    }
}