@IsTest
private class DailyLeadProcessorTest {
    @IsTest
    static void testLeadProcessor() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName = 'Test Lead' + i,
                Company = 'Test Company',
                Status = 'Open'
            ));
        }
        insert leads;

        Test.startTest();

        String jobId = System.schedule('Update Leads', '0 0 0 * * ?', new DailyLeadProcessor());

        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce' LIMIT 200];
        System.assertEquals(200, updatedLeads.size(), 'All Lead records were not updated correctly');
    }
}
