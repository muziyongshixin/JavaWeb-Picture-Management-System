package cn.hncu.Dao;

import javax.persistence.*;

/**
 * Created by 32706 on 2017/4/20.
 */
@Entity
@Table(name = "admin", schema = "photo", catalog = "")
public class AdminEntity {
    private String adminName;
    private String password;

    @Id
    @Column(name = "admin_name")
    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminEntity that = (AdminEntity) o;

        if (adminName != null ? !adminName.equals(that.adminName) : that.adminName != null) return false;
        if (password != null ? !password.equals(that.password) : that.password != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = adminName != null ? adminName.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        return result;
    }
}
