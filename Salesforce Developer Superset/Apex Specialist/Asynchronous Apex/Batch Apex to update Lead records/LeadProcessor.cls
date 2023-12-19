// LeadProcessor.cls
public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    public void execute(Database.BatchableContext bc, List<sObject> scope) {
        List<Lead> leadsToUpdate = new List<Lead>();
        for (sObject s : scope) {
            Lead lead = (Lead)s;
            lead.LeadSource = 'Dreamforce';
            leadsToUpdate.add(lead);
        }
        update leadsToUpdate;
    }

    public void finish(Database.BatchableContext bc) {}
}
