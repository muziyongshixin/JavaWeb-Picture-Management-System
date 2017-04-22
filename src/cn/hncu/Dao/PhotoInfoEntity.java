package cn.hncu.Dao;

import javax.persistence.*;

/**
 * Created by 32706 on 2017/4/19.
 */
@Entity
@Table(name = "photo_info", schema = "photo")
public class PhotoInfoEntity {
    private String id;//编号
    private String dir;//图片路径
    private String ext;//图片类型
    private String relName;//图片名称
    private String ip;//图片上传用户
    private String dt;//上传日期
    private String info;//图片详细描述

    @Id
    @Column(name = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "dir")
    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    @Basic
    @Column(name = "ext")
    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext;
    }

    @Basic
    @Column(name = "relName")
    public String getRelName() {
        return relName;
    }

    public void setRelName(String relName) {
        this.relName = relName;
    }

    @Basic
    @Column(name = "ip")
    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    @Basic
    @Column(name = "dt")
    public String getDt() {
        return dt;
    }

    public void setDt(String dt) {
        this.dt = dt;
    }

    @Basic
    @Column(name = "info")
    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PhotoInfoEntity that = (PhotoInfoEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (dir != null ? !dir.equals(that.dir) : that.dir != null) return false;
        if (ext != null ? !ext.equals(that.ext) : that.ext != null) return false;
        if (relName != null ? !relName.equals(that.relName) : that.relName != null) return false;
        if (ip != null ? !ip.equals(that.ip) : that.ip != null) return false;
        if (dt != null ? !dt.equals(that.dt) : that.dt != null) return false;
        if (info != null ? !info.equals(that.info) : that.info != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (dir != null ? dir.hashCode() : 0);
        result = 31 * result + (ext != null ? ext.hashCode() : 0);
        result = 31 * result + (relName != null ? relName.hashCode() : 0);
        result = 31 * result + (ip != null ? ip.hashCode() : 0);
        result = 31 * result + (dt != null ? dt.hashCode() : 0);
        result = 31 * result + (info != null ? info.hashCode() : 0);
        return result;
    }
}
