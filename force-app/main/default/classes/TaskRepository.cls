/**
 * @author macfelb
 */
public class TaskRepository {
    
    public List<Task> save (List<Task> tasks) {
        upsert tasks;
        return tasks;
    }
}
