package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Goods;
import com.entity.Sysuser;
import com.server.ForderServer;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class GoodsController {
	@Resource
	private GoodsServer goodsService;
	@Resource
	private FtypeServer typeService;
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;

	// 查询一类商品的信息
	@RequestMapping("showGoodsType.do")
	public String showGoodsType(ModelMap map, HttpSession session, int fid) {
		Map<String, Object> gmap = new HashMap<>();
		gmap.put("fid", fid);
		map.put("list", goodsService.getAll(gmap));
		map.put("tlist", typeService.getAll(null));
		return "goods_List";
	}

	// 商品详情
	@RequestMapping("showGoodsx.do")
	public String showGoods(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		Map<String, Object> omap = new HashMap<String, Object>();
		omap.put("fid", id);
		map.put("ulist", userService.getAll(null));
		map.put("u2list", userService.getAll(null));
		map.put("olist", orderService.getAll(omap));
		map.put("tlist", typeService.getAll(null));
		return "goodsx";
	}

	// 分页查询
	@RequestMapping("goodsListFore.do")
	public String goodsListFore(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		Map<String, Object> cmap = new HashMap<String, Object>();
		pmap.put("name", null);
		cmap.put("name", null);
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		Map<String, Object> gysMap = new HashMap<>();
		gysMap.put("utype", "员工");
		map.put("ulist", userService.getAll(gysMap));
		map.put("page", pageBean);
		map.put("list", list);
		map.put("tlist", typeService.getAll(null));
		session.setAttribute("p", 1);
		return "goods_List";
	}

	// 分页模糊查询
	@RequestMapping("searchGoods.do")
	public String searchGoods(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		if (cd.getPrice() != null && !cd.getPrice().equals("")) {
			cmap.put("price", cd.getPrice());
			pmap.put("price", cd.getPrice());
		}
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getAll(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 5);
		map.put("tlist", typeService.getAll(null));
		return "goods_List";
	}

	// 分页模糊查询
	@RequestMapping("showGoods.do")
	public String showGoods(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session, Goods cd) {
		if (page == null || page.equals("")) {
			page = "1";
		}
		PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
		Map<String, Object> pmap = new HashMap<String, Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());

		Map<String, Object> cmap = new HashMap<String, Object>();
		System.out.println("name===" + cd.getName());
		if (cd.getName() != null && !cd.getName().equals("")) {
			cmap.put("name", cd.getName());
			pmap.put("name", cd.getName());
		}
		if (cd.getFid() != null && !cd.getFid().equals("")) {
			cmap.put("fid", cd.getFid());
			pmap.put("fid", cd.getFid());
		}
		int total = goodsService.getCount(cmap);
		pageBean.setTotal(total);
		List<Goods> list = goodsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("tlist", typeService.getAll(null));
		return "goods_List";
	}

	/**
	 * ===后台商品管理===
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("admin/doAddGoods.do")
	public String doAddGoods(ModelMap map) {
		map.put("tlist", typeService.getAll(null));
		return "admin/goods_add";
	}

	@RequestMapping("admin/addGoods.do")
	public String addGoods(@RequestParam(value = "file", required = false) MultipartFile file,
			/*@RequestParam(value = "file2", required = false) MultipartFile file2,*/
			HttpServletRequest request, Goods goods, String img,/* String img2,*/HttpSession session) {
		System.out.println("ddddd");
		Sysuser u = (Sysuser) session.getAttribute("auser");
		System.out.println("u=-=" + u);
		if (u == null || u.equals("")) {
			return "admin/login";
		} else {
			img = fileUpload(file, request, img);
			goods.setImg(img);
			/*img2=fileUpload(file2, request, img2);
			if(img2!="zanwu.jpg") {
				goods.setUpload(img2);
			}*/
			java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
			goods.setPubtime(time.toString().substring(0, 19));
			goods.setIsdel("1");
			goods.setXnum(0);
			goods.setUid(u.getId() + "");
			goodsService.add(goods);
			return "admin/success";
		}
	}

	@RequestMapping("admin/doUpdateGoods.do")
	public String doUpdateGoods(ModelMap map, int id) {
		map.put("goods", goodsService.getById(id));
		map.put("tlist", typeService.getAll(null));
		return "admin/goods_update";
	}

	@RequestMapping("admin/updateGoods.do")
	public String updateGoods(@RequestParam(value = "file", required = false) MultipartFile file,
			/*@RequestParam(value = "file2", required = false) MultipartFile file2,*/
			HttpServletRequest request, Goods goods, String img/*, String img2*/) {
		img = fileUpload(file, request, img);
		if (img != "zanwu.jpg") {
			goods.setImg(img);
		}
		/*img2=fileUpload(file2, request, img2);
		if(img2!="zanwu.jpg") {
			goods.setUpload(img2);
		}*/
		goodsService.update(goods);
		return "admin/success";
	}

	// 分页查询
	@RequestMapping("admin/goodsList.do")
	public String goodsList(ModelMap map, HttpSession session) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			Map<String, Object> pmap = new HashMap<String, Object>();
			if (user.getUtype().equals("员工")) {
				pmap.put("uid", user.getId());
			}
			List<Goods> list = goodsService.getAll(pmap);
			map.put("list", list);
			Map<String, Object> umap = new HashMap<String, Object>();
			umap.put("utype", "员工");
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(umap));
			return "admin/goods_list";
		}
	}

	// 分页模糊查询
	@RequestMapping("admin/goodsListSearch.do")
	public String goodsListSearch(ModelMap map, HttpSession session, Goods cd) {
		Sysuser user = (Sysuser) session.getAttribute("auser");
		if (user == null) {
			return "admin/login";
		} else {
			Map<String, Object> pmap = new HashMap<String, Object>();
			if (cd.getName() != null && !cd.getName().equals("")) {
				pmap.put("name", cd.getName());
			}
			if (cd.getFid() != null && !cd.getFid().equals("")) {
				pmap.put("fid", cd.getFid());
			}
			if (user.getUtype().equals("员工")) {
				pmap.put("uid", user.getId());
			} else {
				if (cd.getUid() != null && !cd.getUid().equals("")) {
					pmap.put("uid", cd.getUid());
				}
			}
			List<Goods> list = goodsService.getAll(pmap);
			map.put("list", list);
			Map<String, Object> umap = new HashMap<String, Object>();
			umap.put("utype", "员工");
			map.put("tlist", typeService.getAll(null));
			map.put("ulist", userService.getAll(umap));
			return "admin/goods_list";
		}

	}

	@RequestMapping("admin/deleteGoods.do")
	public String deleteGoods(int id) {
		goodsService.delete(id);
		return "redirect:goodsList.do";
	}

	// 文件上传
	public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, String img) {
		String path = request.getSession().getServletContext().getRealPath("upload");
		String fileName = file.getOriginalFilename();
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		try {
			file.transferTo(targetFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String pa = request.getContextPath() + "/upload/" + fileName;
		System.out.println("path===" + pa);
		if (fileName != null && !fileName.equals("")) {
			img = fileName;
		} else {
			img = "zanwu.jpg";
		}
		return img;

	}

}
