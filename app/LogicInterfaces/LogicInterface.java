package LogicInterfaces;

import LogicClasses.*;
import models.User;
/**
 * Created by pegah on 3/8/16.
 */
public class LogicInterface {
    public static Users getUser(Long id){
        Users u = new Users();
 	User t = User.find.byId(id);
 	u.setPassword(t.id);
 	return u;
    }


    // creates sample objects for db... called in when first page loaded
    public static void f(Long i){
    	User u = new User(i);
    	u.save();
    }


}
