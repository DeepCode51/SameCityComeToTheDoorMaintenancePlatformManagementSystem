package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Ftype;
import com.server.FtypeServer;

import net.sf.json.JSONObject;

@Controller
public class FtypeController {
	@Resource
	private FtypeServer ftypeService;

	/**
	 * ===商品分类管理===
	 * 
	 * @param ftype
	 * @param response
	 */

	@RequestMapping("admin/addType.do")
	public void addFtype(Ftype ftype, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", ftype.getName());
		System.out.println("uname===" + ftypeService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (ftypeService.checkUname(map) != null) {
			obj.put("info", "ok");
		} else {
			Ftype ftype1 = new Ftype();
			ftype1.setName(ftype.getName());
			ftypeService.add(ftype1);
			obj.put("info", "可以用！");
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	@RequestMapping("admin/doUpdateFtype.do")
	public String doUpdateFtype(ModelMap map, int id) {
		map.put("ftype", ftypeService.getById(id));
		return "admin/type_update";
	}

	// 保存修改
	@RequestMapping("admin/updateFtype.do")
	public void updateFtype(Ftype ftype, HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", ftype.getName());
		System.out.println("uname===" + ftypeService.checkUname(map));
		JSONObject obj = new JSONObject();
		if (ftypeService.checkUname(map) != null && !ftypeService.checkUname(map).getName().equals(ftype.getName())) {
			obj.put("info", "ok");
		} else {
			Ftype ftype1 = ftypeService.getById(ftype.getId());
			ftype1.setName(ftype.getName());
			ftypeService.update(ftype1);
			obj.put("info", "可以用！");
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(obj);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	public void getTypeList(ModelMap map, String btype) {
		Map<String, Object> tmap = new HashMap<>();
		tmap.put("btype", btype);
		List<Ftype> list = ftypeService.getAll(tmap);
		map.put("list", list);
	}

	// 分页查询
	@RequestMapping("admin/typeList.do")
	public String typeList(ModelMap map) {
		getTypeList(map, "商品");
		return "admin/type_list";
	}

	// 分页模糊查询
	@RequestMapping("admin/vagueFtypeList.do")
	public String vagueFtypeList(ModelMap map, Ftype type) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		if (type.getName() != null && !type.getName().equals("")) {
			pmap.put("name", type.getName());
		}
		pmap.put("btype", "商品");
		List<Ftype> list = ftypeService.getAll(pmap);
		map.put("list", list);
		return "admin/type_list";
	}

	@RequestMapping("admin/deleteFtype.do")
	public String deleteFtype(int id) {
		ftypeService.delete(id);
		return "redirect:typeList.do";
	}

	
}
