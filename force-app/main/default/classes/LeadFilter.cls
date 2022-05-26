/**
 * @author macfelb
 */
public class LeadFilter {

    public List<Lead> byChangedStatusTo ( List<Lead> newLeads
                                        , Map<Id,Lead> oldLeads
                                        , String targetStatus  ) {

        return  byStatus ( 
                    byChangedStatus(newLeads, oldLeads) 
                   , targetStatus );                                         
    }

    public List<Lead> byChangedStatus ( List<Lead> newLeads, Map<Id,Lead> oldLeads ) {
        
        List<Lead> filteredLeads = new List<Lead>();
        
        for (Lead lead : newLeads ) {

            Lead oldLead = oldLeads.get(lead.Id);

            if (oldLead.Status != lead.Status) {
                filteredLeads.add(lead);
            }
        }

        return filteredLeads;
    }


    public List<Lead> byStatus ( List<Lead> leads,  String targetStatus ) {

        List<Lead> filteredLeads = new List<Lead>();
        
        for (Lead lead : leads ) {

            if (lead.Status == targetStatus) {
                filteredLeads.add(lead);
            }

        }
    
        return filteredLeads;

    }

}
