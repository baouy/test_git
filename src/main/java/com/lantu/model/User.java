package com.lantu.model;

import java.io.Serializable;

/**
 * 
 * ClassName: User 实体
 * @author chenhua
 * @date 2018年3月21日 上午10:11:11
 * @Description: TODO
 */
public class User implements Serializable {
    private static final long serialVersionUID = 1L;

    private Long id;
    private String username;
    private String password;
    private String email;
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
