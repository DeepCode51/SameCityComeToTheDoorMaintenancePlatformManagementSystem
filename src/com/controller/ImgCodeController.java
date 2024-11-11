package com.controller;

import java.io.ByteArrayInputStream;



import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.util.ImgCodeUtil;

@Controller
public class ImgCodeController  {
	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;
	private ByteArrayInputStream inputStream;
	
	@RequestMapping("admin/showCode.do")
	public String showCode(HttpSession session) throws Exception {
		ImgCodeUtil rdnu = ImgCodeUtil.Instance();
		this.setInputStream(rdnu.getImage()); // 取得带有随机字符串的图片
		/*
		 * ActionContext.getContext().getSession() .put("imgCode",
		 * rdnu.getString());
		 */
		// 取得随机字符串放入HttpSession
		System.out.println("imgcode"+rdnu.getString());
		session.setAttribute("imgCode", rdnu.getString());
		//设置当前session的有效时间为10*60秒
		session.setMaxInactiveInterval(600);
		return "";
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

}

