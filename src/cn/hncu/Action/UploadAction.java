package cn.hncu.Action;

import cn.hncu.Dao.PhotoInfoEntity;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 32706 on 2017/4/19.
 */
public class UploadAction {
    private File pic_data;//Ajax获取图片文件,与控件type=File中的name属性一样
    private String pic_name;//Ajax获取图片文件名称,相应的name属性名称+FileName
    private String pic_ext;//图片类别
    private String pic_info;//图片描述信息

    /**
     * -----------相应的get和set方法----------------
     **/
    public File getPic_data() {
        return pic_data;
    }

    public void setPic_data(File pic_data) {
        this.pic_data = pic_data;
    }

    public String getPic_name() {
        return pic_name;
    }

    public void setPic_name(String pic_name) {
        this.pic_name = pic_name;
    }

    public String getPic_ext() {
        return pic_ext;
    }

    public void setPic_ext(String pic_ext) {
        this.pic_ext = pic_ext;
    }

    public String getPic_info() {
        return pic_info;
    }

    public void setPic_info(String pic_info) {
        this.pic_info = pic_info;
    }

    /**
     * 通过Ajax获取图片信息
     *
     * @return
     * @throws IOException
     */
    public String ajaxGetImage() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain");
        response.setCharacterEncoding("utf-8");
        if (pic_data != null) {
            String fileName = pic_data.getName();
            String savePath = ServletActionContext.getServletContext().getRealPath("/");

            String finalPath = save_pic_on_disk(pic_data, savePath, fileName);
            if (finalPath != null)//将图片存储到本地文件
            {
                if (upload_info_to_database(finalPath, pic_ext, pic_info, "administrator", pic_name))//调用hibernate将数据插入数据库
                {
                    response.getWriter().print("图片上传成功!");//把相应的地址放到前台解析，通过#符号分割
                    return "successful";
                } else {
                    System.out.println("调用hibernate持久化过程出错");
                    response.getWriter().print("图片上传失败!====调用hibernate持久化过程出错");
                    return "failed";
                }
            } else {
                response.getWriter().print("图片上传失败!====保存到本地失败");
                return "failed";
            }


        } else {
            System.out.println("图片数据为空=====================");
            response.getWriter().print("图片上传失败!");
            return "failed";
        }

    }


    private boolean upload_info_to_database(String savePath, String pic_ext, String info, String ip, String pic_name) {
        try {
            java.util.Date date = new java.util.Date();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
            String time = format.format(date);//得到完成订单的时间
            DateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
            String pic_id = format1.format(date) + (int) (Math.random() * 1000);

            Configuration conf = new Configuration().configure();
            SessionFactory sf = conf.buildSessionFactory();
            //Session session = sf.openSession();
            Session  session=sf.getCurrentSession();
            PhotoInfoEntity photo = new PhotoInfoEntity();
            photo.setDir(savePath);
            photo.setDt(time);
            photo.setExt(pic_ext);
            photo.setId(pic_id);
            photo.setInfo(info);
            photo.setIp(ip);
            photo.setRelName(pic_name);

            Transaction tran = session.beginTransaction();
            session.save(photo);
            tran.commit();
            session.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    private String save_pic_on_disk(File data, String savePath, String fileName) {
        String rt = "";
        java.util.Date date = new java.util.Date();
        DateFormat format = new SimpleDateFormat("yyyyMMdd");
        String time = format.format(date);//得到完成订单的时间
        System.out.println(savePath);
        String dir_url = "uploadImage/" + time + "/";
        String realFileName=new Date().getTime()+fileName+".jpg";
        String realPath=savePath+dir_url+realFileName;

        System.out.println("最终保存的文件路径为======" + realPath);

        try {

            File file = new File(savePath + dir_url);//每天的图片放在一个文件夹里
            //如果文件夹不存在则创建
            if (!file.exists() && !file.isDirectory()) {
                System.out.println(dir_url + "文件夹不存在，新建一个");
                file.mkdir();
            }

            FileOutputStream out=new FileOutputStream(realPath);
            FileInputStream in=new FileInputStream(data);
            byte[]buffer=new byte[1024];
            int len=0;
            while((len=in.read(buffer))!=-1){
                out.write(buffer,0,len);

            }
            out.flush();
            out.close();
            in.close();
            return dir_url+realFileName;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("保存文件到文件中出错=================Database.save_picture_in_file");
            return null;
        }
    }


    public static void main(String arg[]) {


    }


}