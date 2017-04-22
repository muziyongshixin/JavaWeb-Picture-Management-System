package cn.hncu.test;

import cn.hncu.Dao.PhotoInfoEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;



/**
 * Created by 32706 on 2017/4/19.
 */
public class HibernateTest {

    public static void main(String arg[])
    {
        Configuration conf=new Configuration().configure();
        SessionFactory sf=conf.buildSessionFactory();
        Session session=sf.openSession();
        PhotoInfoEntity photo=new PhotoInfoEntity();
        photo.setDir("/////casdsd//sd/");
        photo.setDt("2017-10-24/10:12:11");
        photo.setExt(".jpg");
        photo.setId("1234567700");
        photo.setInfo("测试信息啊啊啊啊啊");
        photo.setIp("localhost");
        photo.setRelName("firstPhoto");

        Transaction tran=session.beginTransaction();
        session.save(photo);
        tran.commit();
        session.close();

    }
}
