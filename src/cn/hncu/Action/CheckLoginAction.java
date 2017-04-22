package cn.hncu.Action;

import cn.hncu.Dao.AdminEntity;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by 32706 on 2017/4/20.
 */
public class CheckLoginAction {
    private String admin;
    private String password;

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public  String check()
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        HttpServletRequest request=ServletActionContext.getRequest();
        HttpSession session=request.getSession();


        System.out.println(this.admin);
        String realPassword=getPasswordByAccount(this.admin);
        if(realPassword!=null&&realPassword.equals(password))
        {
            session.setAttribute("username",admin);
            return "successful";
        }
        else
        {
            return "failed";
        }

    }


    private String getPasswordByAccount(String admin)
    {
        String rt=null;


        Configuration configuration=new Configuration().configure();
        SessionFactory sessionFactory=configuration.buildSessionFactory();
        Session session=sessionFactory.openSession();
        AdminEntity tem=(AdminEntity)session.get(AdminEntity.class,admin) ;


       if(tem!=null)
        {
            return  tem.getPassword();
        }
        return rt;
    }

}
