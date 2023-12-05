@isTest
public class TestVerifyDate {
    @isTest
    static void testCheckDatesWithin30Days() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(25); // Within 30 days of date1
        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result);
    }

    @isTest
    static void testCheckDatesBeyond30Days() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(35); // Beyond 30 days of date1
        Date result = VerifyDate.CheckDates(date1, date2);
        Date expected = VerifyDate.SetEndOfMonthDate(date1);
        System.assertEquals(expected, result);
    }

    @isTest
    static void testCheckDatesInThePast() {
        Date date1 = Date.today();
        Date date2 = date1.addDays(-5); // In the past compared to date1
        Date result = VerifyDate.CheckDates(date1, date2);
        Date expected = VerifyDate.SetEndOfMonthDate(date1);
        System.assertEquals(expected, result);
    }
}
