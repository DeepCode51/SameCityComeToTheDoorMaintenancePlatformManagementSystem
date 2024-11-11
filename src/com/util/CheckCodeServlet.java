package com.util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class CheckCodeServlet extends HttpServlet {

	String str = "abcedfghijklmnopqrstuvwxyzABCEDFGHIJKLMNOPQRSTUVWXYZ";
	private Random random = new Random();

	// 定义一个方法，能够随机生成4个字符
	public String getStr() {
		String s = "";

		int len = str.length(); // 字符串的长度
		for (int i = 0; i < 4; i++) {
			s += str.charAt(random.nextInt(len));
		}
		return s;
	}

	// 用于随机生成颜色的方法
	public Color getColor() {
		int red = random.nextInt(256);
		int green = random.nextInt(256);
		int blue = random.nextInt(256);
		Color color = new Color(red, green, blue);
		return color;
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 因为a链接是get请求，所以代码写在doGet方法中
		// 画一个面板
		BufferedImage image = new BufferedImage(70, 30,
				BufferedImage.TYPE_INT_RGB);
		// 画笔
		Graphics pen = image.getGraphics();

		pen.setColor(Color.white);

		// 画一个矩形
		pen.fillRect(0, 0, 70, 30);

		pen.setFont(new Font("微软雅黑", Font.BOLD, 20));
		// 把四个字符写到图片中
		String msg = getStr();
		//将生成的验证码，放入到session范围中
		HttpSession session=request.getSession();
		session.setAttribute("autoCode", msg);
		
		for (int i = 0; i < 4; i++) {
            pen.setColor(getColor());
			pen.drawString(msg.charAt(i) + "", i * 15 + 5, 20);

		}

		// 从response对象中获取到一个输出流，能够将画好的图片传递给客户端
		ServletOutputStream sos = response.getOutputStream();

		ImageIO.write(image, "png", sos);

		sos.flush();
		sos.close();

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
	}

}
