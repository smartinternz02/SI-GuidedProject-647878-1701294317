trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToInsert = new List<Task>();
    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed Won') {
            Task followUpTask = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id
            );
            tasksToInsert.add(followUpTask);
        }
    }
    if (!tasksToInsert.isEmpty()) {
        insert tasksToInsert;
    }
}
