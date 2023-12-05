public class VerifyDate {

    // Method to handle potential checks against two dates
    public static Date CheckDates(Date date1, Date date2) {
        // If date2 is within the next 30 days of date1, use date2. Otherwise, use the end of the month
        if (DateWithin30Days(date1, date2)) {
            return date2;
        } else {
            return SetEndOfMonthDate(date1);
        }
    }

    // Method to check if date2 is within the next 30 days of date1
    private static Boolean DateWithin30Days(Date date1, Date date2) {
        // Check for date2 being in the past
        if (date2 < date1) {
            return false;
        }

        // Check that date2 is within (>=) 30 days of date1
        Date date30Days = date1.addDays(30); // Create a date 30 days away from date1
        if (date2 >= date30Days) {
            return false;
        } else {
            return true;
        }
    }

    // Method to return the end of the month of a given date
    @TestVisible
    private static Date SetEndOfMonthDate(Date date1) {
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        return lastDay;
    }
}
