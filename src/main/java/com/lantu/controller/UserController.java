package com.lantu.controller;

import com.lantu.model.User;
import com.lantu.service.UserServicre;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * 
 * ClassName: UserController 
 * @author chenhua
 * @date 2018年3月21日 上午9:54:15
 * @Description: TODO
 */
@Controller
@RequestMapping(value = "/v1/user", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {

    @Resource(name="userService")
    private UserServicre userServicre;

    //跳转到jsp页面
    @RequestMapping("jspViewTest")
    public String jspViewTest() {
        return "index";
    }

    //返回数据对象
    @RequestMapping("dataTest")
    @ResponseBody
    public String dataTest() {
        return "index";
    }

    @RequestMapping(value = "getUser", method = RequestMethod.GET)
    public String getUser(@RequestParam("id") Long id, Model model) {
        User user = userServicre.getById(id);
        model.addAttribute("user", user);
        return "user";
    }

    @RequestMapping("getById")
    @ResponseBody
    /*
    POJO对象要转成Json，则要求POJO中的属性必须都有getter方法
    需要有json对应的包
    不加返回时406报错：
    The resource identified by this request is only capable of generating responses with characteristics not acceptable according to the request "accept" headers.-->
    */
    public User getById(@RequestParam("id") Long id) {
        User user = userServicre.getById(id);
        return user;
    }
}
