/**
 * @author macfelb
 */

public with sharing class LeadTriggerHandler extends TriggerHandler {
    
    List<Lead> newLeads;
    Map<Id, Lead> oldLeads;
    LeadFilter filter;
    LeadTaskEnricher taskEnricher;
    
    public LeadTriggerHandler() {
        this ( (List<Lead>) Trigger.new, 
                (Map<Id, Lead>) Trigger.oldMap);
            }

    public LeadTriggerHandler(List<Lead> newLeads, Map<Id, Lead> oldLeads) {
        this.newLeads = newLeads;
        this.oldLeads = oldLeads;
        this.filter = new LeadFilter();
        this.taskEnricher = new LeadTaskEnricher();
        }

    override
    public void afterUpdate() {

        createTaskForPendingContactStatus();

        //Removed by LeadTaskEnricher
        // List<Task> tasks = new List<Task>();

        // List<Lead> leadsWithChangedStatus = filter.byChangedStatusTo(newLeads
        //                                                             , oldLeads
        //                                                             , 'Pending contact' );
        // for (Lead lead : leadsWithChangedStatus) {

        //     Tasks.add( new Task(
        //         Subject = 'Contact ' + lead.LastName
        //         , WhoId = lead.Id
        //         , Status = 'Not Started'));
            
        // }

        // if(!tasks.isEmpty()) {
        //     insert tasks;
        // }     
    }

    private void createTaskForPendingContactStatus () {
        List<Lead> leads = this.filter.byChangedStatusTo(newLeads
                                                        , oldLeads
                                                        , 'Pending contact' );
        this.taskEnricher.createContactTasks(leads);                                                                                
    }

}
