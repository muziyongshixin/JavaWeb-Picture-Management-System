package cn.hncu.test;

import java.io.*;

/**
 * Created by 32706 on 2017/4/20.
 */
public class TestFile {

    public static  void main(String arg[]) throws Exception
    {
        ObjectInputStream in=new ObjectInputStream(new FileInputStream("C:/Users/32706/Pictures/待选壁纸/9.jpg"));
        File inram=(File)in.readObject();

        ObjectOutputStream out=new ObjectOutputStream(new FileOutputStream(new File("C:/Users/32706/Pictures/待选壁纸/10.jpg")));
        out.writeObject(inram);

        out.flush();
        out.close();
    }
}
