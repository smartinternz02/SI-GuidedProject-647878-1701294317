global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext sc) {
        List<Lead> leadsToUpdate = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        for (Lead lead : leadsToUpdate) {
            lead.LeadSource = 'Dreamforce';
        }
        update leadsToUpdate;
    }
}
