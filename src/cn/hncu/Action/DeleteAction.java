package cn.hncu.Action;

import cn.hncu.Dao.PhotoInfoEntity;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * Created by 32706 on 2017/4/19.
 */
public class DeleteAction {

    private String filepath;//图片路径
    private String id;//图片编号


    /**
     * -----------相应的get和set方法----------------
     **/
    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    /**
     * 通过Ajax获取图片信息
     *
     * @return
     * @throws IOException
     */
    public String DeleteImage() throws Exception {


        System.out.println(filepath + "===========" + id);


        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        if (filepath != null&&id!=null) {

            String ServerPath = ServletActionContext.getServletContext().getRealPath("/");



            if (delete_pic_on_disk(ServerPath+filepath))//将图片从本地文件中删除
            {
                if (delete_info_from_database(id))//调用hibernate将数据从数据库中删除
                {
                    response.getWriter().print("图片删除成功!");//把相应的地址放到前台解析，通过#符号分割
                    return "successful";
                } else {
                    System.out.println("调用hibernate删除信息时出错");
                    response.getWriter().print("图片删除失败!====调用hibernate持久化过程出错");
                    return "failed";
                }
            } else {
                response.getWriter().print("图片删除失败!====保存到本地失败");
                return "failed";
            }


        } else {
            System.out.println("数据为空=====================");
            response.getWriter().print("图片删除失败!");
            return "failed";
        }

    }


    private boolean delete_info_from_database(String  id) {//从数据库中删除记录


            Configuration conf = new Configuration().configure();
            SessionFactory sf = conf.buildSessionFactory();
            Session session = sf.openSession();
            PhotoInfoEntity photo =(PhotoInfoEntity)session.get(PhotoInfoEntity.class,id);
            if(photo!=null)
            {
                Transaction transaction=session.beginTransaction();
                session.delete(photo);
                transaction.commit();
                return true;
            }
            else
            {
                return false;
            }



    }


    private boolean delete_pic_on_disk(String Path) {

        System.out.println("将要删除的文件路径为======" + Path);


            File file = new File(Path);//每天的图片放在一个文件夹里
            //如果文件夹不存在则创建
            if (!file.exists()) {
                System.out.println( "文件不存在，删除文件失败");
                return false;
            }
            else {
                file.delete();
                return true;
            }


    }


    public static void main(String arg[]) {


    }


}