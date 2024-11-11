package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Forder;
import com.entity.Fshop;
import com.entity.Goods;
import com.entity.Sysuser;
import com.entity.TongJi;
import com.server.ForderServer;
import com.server.FshopServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.util.Info;
import com.util.PageBean;

import net.sf.json.JSONObject;

@Controller
public class ForderController {
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	@Resource
	private GoodsServer goodsService;
	@Resource
	private FshopServer shopService;

	// 退货 tuiHuo.do
	@RequestMapping("tuiHuo.do")
	public String tuiHuo(HttpServletRequest request, Forder order, HttpSession session, int id) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "nologin";
		} else {
			order = orderService.getById(id);
			order.setStatus("待确认退货");
			order.setKid(id);
			orderService.update(order);
			return "redirect:shopList.do";
		}
	}

	// 购买
	@RequestMapping("addOrder.do")
	public String addOrder(HttpServletRequest request, Forder order, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		if (u == null) {
			return "login";
		} else {
			u = userService.getById(u.getId());
			if (order.getZprice() > u.getMoney()) {
				return "redirect:doAddMoney.do";
			} else {
				String ono = Info.getID();
				System.out.println("订单号rr===" + ono);
				Map<String, Object> smap = new HashMap<String, Object>();
				smap.put("uid", u.getId());
				smap.put("status", "购物车");
				List<Fshop> slist = shopService.getAll(smap);
				for (Fshop fs : slist) {
					Fshop ff = shopService.getById(fs.getId());
					Goods gg = goodsService.getById(ff.getFid());
					if(gg.getXnum()!=null){
						gg.setXnum(gg.getXnum()+ff.getNum());
					}else{
						gg.setXnum(ff.getNum());
					}
					gg.setId(ff.getFid());
					goodsService.update(gg);
					ff.setStatus("已支付，待维修");
					ff.setId(fs.getId());
					ff.setOid(ono);
					shopService.update(ff);
				}
				Double dd = u.getMoney();
				Double dou = dd - order.getZprice();
				u.setMoney(dou);
				if (u.getJf()!=null) {
					u.setJf(u.getJf()+1);
				}else {
					u.setJf(1);
				}
				u.setId(u.getId());
				userService.update(u);
				order.setIsdel("1");
				order.setOno(ono);
				order.setPubtime(time.toString().substring(0, 10));
				order.setStime(time.toString().substring(0, 19));
				order.setUid(u.getId());
				order.setStatus("已支付，待维修");
				order.setZprice(order.getZprice() + 0);
				orderService.add(order);
				session.setAttribute("info", "支付成功！");
				return "success";
			}
		}
	}

	// 前台订单详情查看showOrderDetail.do
	@RequestMapping("showOrderDetail.do")
	public String fshowOrderDetail(int id, ModelMap map, HttpSession session) {
		Forder order = orderService.getById(id);
		Map<String, Object> gmap = new HashMap<String, Object>();
		gmap.put("oid", order.getOno());
		map.put("list", shopService.getAll(gmap));
		map.put("order", order);
		map.put("glist", goodsService.getAll(null));
		map.put("ulist", userService.getAll(null));
		return "order_detail";
	}

	// 购物车
	@RequestMapping("addshop.do")
	public String addForder(HttpServletRequest request, Fshop shop, HttpSession session, int fid) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		Timestamp time = new Timestamp(System.currentTimeMillis());
		if (u == null) {
			return "login";
		} else {
			Map<String, Object> smap = new HashMap<>();
			smap.put("uid", u.getId());
			smap.put("fid", fid);
			smap.put("status", "购物车");
			int count = shopService.getCount(smap);
			if (count > 0) {
				Fshop shop1 = shopService.getAll(smap).get(0);
				shop1.setNum(shop1.getNum() + 1);
				shopService.update(shop1);
			} else {
				Goods g = goodsService.getById(fid);
				shop.setUid(u.getId());
				shop.setFid(fid);
				shop.setSid(Integer.parseInt(g.getUid()));
				shop.setStatus("购物车");
				shop.setPubtime(time.toString().substring(0, 19));
				shop.setNum(1);
				shopService.add(shop);
			}
			return "redirect:showShop.do";

		}

	}

	// 显示购物车
	@RequestMapping("showShop.do")
	public String showShop(HttpServletRequest request, Fshop shop, HttpSession session, ModelMap map) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			Map<String, Object> smap = new HashMap<String, Object>();
			Map<String, Object> spmap = new HashMap<String, Object>();
			smap.put("uid", u.getId());
			smap.put("status", "购物车");
			spmap.put("status", "空闲中");
			map.put("list", shopService.getAll(smap));
			map.put("glist", goodsService.getAll(null));
			map.put("user", userService.getById(u.getId()));
			return "car_list";
		}

	}

	@RequestMapping("deleteForderF.do")
	public String deleteForderF(int id) {
		orderService.delete(id);
		return "redirect:shopList.do";
	}

	
		@RequestMapping("deleteShop.do")
	public String deleteShop(int id) {
		shopService.delete(id);
		return "redirect:showShop.do";
	}
	// 修改购物车的数量
	@RequestMapping("updateShopNum.do")
	public String updateShopNum(HttpServletRequest request, Fshop shop) {
		shopService.update(shop);
		return "redirect:showShop.do";
	}

	// 完成
	@RequestMapping("wanChen.do")
	public String wanChen(int id, Forder yp) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		yp.setStatus("已确认");
		yp.setKid(id);
		yp.setStime(time.toString().substring(0, 19));
		orderService.update(yp);
        return "redirect:shopList.do";
	}

	// 查看订单详情
	@RequestMapping("doAddpj.do")
	public String doAddpj(int id, ModelMap map, Fshop shop, HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			Forder order = orderService.getById(id);
			Sysuser user = userService.getById(order.getUid());
			Map<String, Object> gmap = new HashMap<String, Object>();
			gmap.put("oid", order.getOno());
			map.put("list", shopService.getAll(gmap));
			map.put("order", order);
			map.put("glist", goodsService.getAll(null));
			map.put("user", user);
			return "orderx";
		}
	}

	// 分页查询
	@RequestMapping("shopList.do")
	public String jianList(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		Sysuser u = (Sysuser) session.getAttribute("user");
		if (u == null) {
			return "login";
		} else {
			if (page == null || page.equals("")) {
				page = "1";
			}
			PageBean pageBean = new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap = new HashMap<String, Object>();
			Map<String, Object> umap = new HashMap<String, Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			pmap.put("uid", u.getId());
			umap.put("uid", u.getId());
			int total = orderService.getCount(umap);
			pageBean.setTotal(total);
			List<Forder> list = orderService.getByPage(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			map.put("ulist", userService.getAll(null));
			map.put("flist", goodsService.getAll(null));
			session.setAttribute("p", 1);
			return "myorderlist";
		}
	}

	/**
	 * ===后台订单管理===
	 * 
	 * @param map
	 * @return
	 */
	// 分页查询
	@RequestMapping("admin/ForderList.do")
	public String ForderList(ModelMap map) {
		List<Forder> list = orderService.getAll(null);
		Map<String, Object> umap = new HashMap<>();
		umap.put("utype", "用户");
		List<Sysuser> ulist = userService.getAll(umap);
		List<Goods> jzlist = goodsService.getAll(null);
		map.put("list", list);
		map.put("ulist", ulist);
		map.put("flist", jzlist);
		return "admin/order_list";
	}

	@RequestMapping("admin/orderListSearch.do")
	public String orderListSearch(ModelMap map, HttpSession session, Forder forder) {
		Map<String, Object> pmap = new HashMap<String, Object>();
		if (forder.getOno() != null && !forder.getOno().equals("")) {
			pmap.put("ono", forder.getOno());
		}
		if (forder.getStatus() != null && !forder.getStatus().equals("")) {
			pmap.put("status", forder.getStatus());
		}
		if (forder.getUid() != null && !forder.getUid().equals("")) {
			pmap.put("uid", forder.getUid());
		}
		List<Forder> list = orderService.getAll(pmap);
		Map<String, Object> umap = new HashMap<>();
		umap.put("utype", "用户");
		List<Sysuser> ulist = userService.getAll(umap);
		List<Goods> jzlist = goodsService.getAll(null);
		map.put("list", list);
		map.put("ulist", ulist);
		map.put("flist", jzlist);
		return "admin/order_list";
	}

	// 订单详情查看showOrderDetail.do
	@RequestMapping("admin/showOrderDetail.do")
	public String showOrderDetail(int id, ModelMap map, HttpSession session) {
		Forder order = orderService.getById(id);
		Map<String, Object> gmap = new HashMap<String, Object>();
		gmap.put("oid", order.getOno());
		map.put("list", shopService.getAll(gmap));
		map.put("order", order);
		map.put("glist", goodsService.getAll(null));
		map.put("ulist", userService.getAll(null));
		return "admin/order_detail";
	}

	//
	@RequestMapping("admin/orderQueRen.do")
	public String orderQueRen(int id, Forder yp) {
		Timestamp time = new Timestamp(System.currentTimeMillis());
		yp.setStatus("维修完成");
		yp.setKid(id);
		Forder order = orderService.getById(id);
		yp.setEtime(time.toString().substring(0, 19));
		orderService.update(yp);
		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("oid", order.getOno());
		List<Fshop> slist = shopService.getAll(cmap);
		for (Fshop ss : slist) {
			ss.setStatus("维修完成");
			ss.setId(ss.getId());
			shopService.update(ss);
		}
		return "redirect:ForderList.do";
	}

	// 确认退货 queRenTuiHuo.do
	@RequestMapping("admin/queRenTuiHuo.do")
	public String queRenTuiHuo(HttpServletRequest request, Forder order, HttpSession session, int id) {
		order = orderService.getById(id);
		order.setStatus("已退货，退款");
		order.setKid(id);
		Sysuser u = userService.getById(order.getUid());
		u.setMoney((u.getMoney()) + order.getZprice());
		u.setId(order.getUid());
		userService.update(u);
		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("oid", order.getOno());
		List<Fshop> slist = shopService.getAll(cmap);
		for (Fshop ss : slist) {
			ss.setStatus("已退货，退款");
			ss.setId(ss.getId());
			Goods gg = goodsService.getById(ss.getFid());
			gg.setXnum(gg.getXnum()-ss.getNum());
			gg.setId(ss.getFid());
			goodsService.update(gg);
			shopService.update(ss);
		}
		orderService.update(order);
		return "redirect:ForderList.do";
	}

	@RequestMapping("admin/juJue.do")
	public String juJue(int id, ModelMap map, HttpSession session) {
		Forder order = orderService.getById(id);
		order.setStatus("已发货");
		order.setKid(id);
		orderService.update(order);
		return "redirect:ForderList.do";
	}

	@RequestMapping("admin/deleteForder.do")
	public String deleteForder(int id) {
		orderService.delete(id);
		return "redirect:ForderList.do";
	}
	
	@RequestMapping("admin/goods_tj.do")
	public String good_tj(@RequestParam(value = "page", required = false) String page, ModelMap map,
			HttpSession session) {
		List<Goods> list = goodsService.getAll(null);
		map.put("list", list);
		return "admin/goods_tj";

	}

	// 统计分析

	// 统计分析
	@RequestMapping("admin/tj2.do")
	public void selectTongji(ModelMap map, Goods record, HttpSession session, String stime, String etime,
			HttpServletResponse response) {

		System.out.println("开始时间" + stime);
		System.out.println("结束时间" + etime);
		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("stime1", stime);
		cmap.put("etime1", etime);
		List<Goods> list = goodsService.getAll2(null);
		// List<TongJi> tjlist = orderService.getTongJi2(cmap);
		System.out.println("aaaaaaaaaaa==" + list.size());
		/* ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月'] */
		// xmlstr = "<graph showNames='1' decimalPrecision='0' > ";
		String sj = "[";
		String hp = "[";
		for (Goods tj : list) {
			sj += "'" + tj.getId() + "',";
			hp += "" + tj.getXnum() + ",";
		}
		int n = sj.length();
		sj = sj.substring(0, n - 1);
		int n3 = hp.length();
		hp = hp.substring(0, n3 - 1);
		sj += "]";
		hp += "]";
		// stu="['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']";
		// account="[120, 49, 70, 232, 256, 767, 1356, 1622, 326, 200,164, 133]";
		System.out.println(sj);
		System.out.println(hp);
		// xmlstr += "</graph>";
		// System.out.println("xml==" + xmlstr);
		// System.out.println("ccccccccccccccccccc=="+olist.size());
		// 把集合转换为jsonarray
		// JSONArray array=JSONArray.fromObject(olist);
		JSONObject obj = new JSONObject();
		obj.put("sj", sj);
		obj.put("hp", hp);
		// obj.put("list", array);
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

	// 统计分析
	@RequestMapping("admin/tj.do")
	public void selectTongji(ModelMap map, Fshop shop, HttpSession session, String starttime, String endtime,
			String xmlstr, HttpServletResponse response) {
		System.out.println("开始时间" + starttime);
		System.out.println("结束时间" + endtime);
		Map<String, Object> cmap = new HashMap<String, Object>();
		cmap.put("stime1", starttime);
		cmap.put("etime1", endtime);
		List<TongJi> tjlist = orderService.getTongJi(cmap);
		System.out.println("aaaaaaaaaaa==" + tjlist.size());
		xmlstr = "<graph showNames='1'  decimalPrecision='0'  > ";
		for (TongJi tj : tjlist) {

			xmlstr += "<set name='" + tj.getName() + "' value='" + tj.getAmount() + "'/> ";
		}
		xmlstr += "</graph>";
		System.out.println("xml==" + xmlstr);
		// System.out.println("ccccccccccccccccccc=="+olist.size());
		// 把集合转换为jsonarray
		// JSONArray array=JSONArray.fromObject(olist);
		JSONObject obj = new JSONObject();
		obj.put("xmlstr", xmlstr);
		// obj.put("list", array);
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

	// 文件上传
	public String fileUpload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, String img) {
		String path = request.getSession().getServletContext().getRealPath("upload");
		System.out.println("path===" + path);
		System.out.println("file===" + file);
		String fileName = file.getOriginalFilename();
		System.out.println("fileName===" + fileName);
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
			img = null;
		}

		return img;

	}

}
