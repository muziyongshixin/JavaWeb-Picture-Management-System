package cn.hncu.Dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;


public class QueryAllPhoto {


    public  ArrayList QueryByExt(String category) {
        ArrayList rt=new ArrayList();
        Configuration configuration=new Configuration().configure();
        SessionFactory sessionFactory=configuration.buildSessionFactory();
        Session session=sessionFactory.openSession();

        String hql="from PhotoInfoEntity where ext='"+category+"'";
        System.out.println(hql+"========================================================================");

        Query query=session.createQuery(hql);
        List list=query.list();
        for(int i=0;i<list.size();i++)
        {
            PhotoInfoEntity tem=(PhotoInfoEntity)list.get(i);
            rt.add(tem);
        }
        System.out.println(rt.size()+"大小========================================================================");
        return  rt;
    }



    public  ArrayList QueryByKeyword(String keyword) {
        ArrayList rt=new ArrayList();
        Configuration configuration=new Configuration().configure();
        SessionFactory sessionFactory=configuration.buildSessionFactory();
        Session session=sessionFactory.openSession();

        String hql="from PhotoInfoEntity where relName  like '%"+keyword+"%'";
        System.out.println(hql+"========================================================================");

        Query query=session.createQuery(hql);
        List list=query.list();
        for(int i=0;i<list.size();i++)
        {
            PhotoInfoEntity tem=(PhotoInfoEntity)list.get(i);
            rt.add(tem);
        }
        System.out.println(rt.size()+"大小========================================================================");
        return  rt;
    }



    public  static  void main(String arg[])
    {
        QueryAllPhoto q=new QueryAllPhoto();
        ArrayList result=q.QueryByExt("风景图片");

        System.out.println(result.size());

    }

}
