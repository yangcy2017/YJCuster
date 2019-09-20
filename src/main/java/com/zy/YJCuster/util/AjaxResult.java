package com.zy.YJCuster.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

/**
 * @Description 异步请求结果集
 * @Author yangcy
 * @Date 2019/3/11 18:00
 **/
public class AjaxResult {
    /**
     * code
     */
    private Integer code;
    /**
     * 提示消息
     */
    private String msg;
    /**
     * 数据
     */
    private Object data;

    private AjaxResult(Integer code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public static AjaxResult instance() {
        return new AjaxResult(null, null, null);
    }

    public static AjaxResult instanceForSuccess() {
        return new AjaxResult(0, "请求成功", null);
    }

    public static AjaxResult instanceForSuccess(Object data) {
        return new AjaxResult(0, "请求成功", data);
    }

    public static AjaxResult instanceForError(String msg) {
        return new AjaxResult(-1, msg, null);
    }

    /**
     * @return java.lang.String
     * @Author yangcy
     * @Description 获取JSON结果集
     * @Date 18:04 2019/3/11
     * @Param []
     **/
    public String toJsonString() {
        return JSON.toJSON(this).toString();
    }

    public String toJsonString(SerializerFeature serializerFeature) {
        return JSON.toJSONString(this, serializerFeature);
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
