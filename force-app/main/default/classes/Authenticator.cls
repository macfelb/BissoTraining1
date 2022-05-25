public class Authenticator {

    public String user;
    public String password;
   
    public Authenticator(String user, String password) {
        this.user = user;
        this.password = password;
    }
    
    public Boolean authenticate (Authenticable authenticable) {
        return authenticable.login(this.user, this.password);
    }

}