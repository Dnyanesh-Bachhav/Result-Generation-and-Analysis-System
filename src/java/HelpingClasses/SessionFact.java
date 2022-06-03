package HelpingClasses;

import java.sql.SQLException;
import javax.inject.Singleton;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

@Singleton
public class SessionFact {
   static SessionFactory sf;
    private static ServiceRegistry serviceRegistry;
    static Configuration cfg;
//to disallow creating objects by other classes.

    private SessionFact() {
    }
//maling the Hibernate SessionFactory object as singleton

    public static synchronized SessionFactory getSessionFact(){

        if (sf == null) {
	cfg = new Configuration();
        cfg.configure("/Resources/hibernate.cfg.xml");
        serviceRegistry=new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
        sf=cfg.buildSessionFactory(serviceRegistry);
        return sf;
        }

            return sf;
    }
    public static void close(){
        sf.close();
        
    }
}
