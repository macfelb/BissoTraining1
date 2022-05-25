trigger Lead on Lead (after update) {

    //any change in other object, trigger should execute only in after

    List<Lead> newLeads = (List<Lead>) Trigger.new;
    Map<Id, Lead> oldLeads = (Map<Id, Lead>) Trigger.oldMap;

    switch on Trigger.operationType {

        when AFTER_UPDATE {

            /* First code from Bisso explain how to interact with other object. As mantioned, it should works in Before Update.
            for (Lead lead : newLeads) {

                Lead oldLead = oldLeads.get(lead.id);

                if (oldLead.Status != lead.Status
                    && lead.Status == 'Pending contact') {

                        Task task = new Task(
                            Subject = 'Contact ' + lead.LastName
                            , WhoId = lead.Id
                            , Status = 'Not Started');

                        insert task;
                }*/

                /* Second code from Bisso explain hot to interact using a List of task. Look that way the task was defined using .add().
                    The insert out of FOR(){} checking if the list is empty.

                List<Task> tasks = new List<Task>();

                for (Lead lead : newLeads) {

                    Lead oldLead = oldLeads.get(lead.id);
    
                    if (oldLead.Status != lead.Status
                        && lead.Status == 'Pending contact') {
    
                            Tasks.add( new Task(
                                Subject = 'Contact ' + lead.LastName
                                , WhoId = lead.Id
                                , Status = 'Not Started'));
    
                    }

                    if(!tasks.isEmpty()) {
                        insert task;
                    }*/

                List<Task> tasks = new List<Task>();

                for (Lead lead : newLeads) {
    
                    Lead oldLead = oldLeads.get(lead.id);
        
                    if (oldLead.Status != lead.Status
                    && lead.Status == 'Pending contact') {
        
                            Tasks.add( new Task(
                                Subject = 'Contact ' + lead.LastName
                                , WhoId = lead.Id
                                , Status = 'Not Started'));
                    }
    
                    if(!tasks.isEmpty()) {
                        insert task;
                    }     
                                   
            }
        }
    }
}