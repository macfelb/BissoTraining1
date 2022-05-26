public class LeadTaskEnricher {

    TaskRepository repository;

    public LeadTaskEnricher () {
        this.repository = new TaskRepository();
    }

    public List<Task> createContactTasks (List<Lead> leads) {

        List<Task> tasks = new List<Task>();

        for (Lead lead : leads) {

            Tasks.add( buildTask( lead ) );
            
        }

        return repository.save(tasks);

    }

    private Task buildTask (Lead lead) {
        return new Task(
            Subject = 'Contact ' + lead.LastName
            , WhoId = lead.Id
            , Status = 'Not Started');
    }

}
