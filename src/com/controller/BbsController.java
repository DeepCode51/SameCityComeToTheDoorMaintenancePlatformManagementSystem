package com.controller;

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

import com.entity.Bbs;
import com.entity.BbsWithBLOBs;
import com.entity.Sysuser;
import com.server.BbsServer;
import com.server.ForderServer;
import com.server.FtypeServer;
import com.server.GoodsServer;
import com.server.SysuserServier;
import com.util.PageBean;

@Controller
public class BbsController {
	@Resource
	private FtypeServer typeService;
	@Resource
	private ForderServer orderService;
	@Resource
	private SysuserServier userService;
	@Resource
	private BbsServer bbsService;
	@Resource
	private GoodsServer goodsService;
	

	@RequestMapping("addBbs.do")
	public String addBbs(HttpServletRequest request,BbsWithBLOBs bbs,HttpSession session){
		System.out.println("ddddd");
		Sysuser u=(Sysuser)session.getAttribute("user");
		System.out.println("u=-="+u);
		if(u==null){
			return "login";
		}else{
		java.sql.Timestamp time=new Timestamp(System.currentTimeMillis());
		bbs.setPubtime(time.toString().substring(0, 19));
		bbs.setIsdel("1");
		bbs.setBtype("留言");
		bbs.setStatus("待回复");
		bbs.setUid(u.getId());
		bbsService.add(bbs);
		return "redirect:myBbsList.do";
		}
	}
	
	

//	我的留言
//	分页查询
	@RequestMapping("myBbsList.do")
	public String myBbsList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session){
		Sysuser u=(Sysuser)session.getAttribute("user");
		if(u==null){
			return "login";
		}else{
			if(page==null||page.equals("")){
				page="1";
			}
			PageBean pageBean=new PageBean(Integer.parseInt(page), PageBean.PAGESIZE);
			Map<String, Object> pmap=new HashMap<String,Object>();
			pmap.put("pageno", pageBean.getStart());
			pmap.put("pageSize", pageBean.getPageSize());
			Map<String, Object> cmap=new HashMap<String, Object>();
			pmap.put("btype", "留言");
			cmap.put("btype", "留言");
			pmap.put("uid", u.getId());
			cmap.put("uid", u.getId());
			int total=bbsService.getCount(cmap);
			pageBean.setTotal(total);
			List<BbsWithBLOBs> list=bbsService.getAll(pmap);
			map.put("page", pageBean);
			map.put("list", list);
			session.setAttribute("p", 1);
			return "bbs_list";
		}
		
	}
	
	
	@RequestMapping("deleteBbsFore.do")
	public String deleteBbsFore(int id){
		bbsService.delete(id);
		return "redirect:myBbsList.do";
	}
	
	
	@RequestMapping("admin/doUpdateBbs.do")
	public String doUpdateBbs(ModelMap map,int id){
		map.put("bbs", bbsService.getById(id));
		map.put("ulist", userService.getAll(null));
		return "admin/bbs_update";
	}
	@RequestMapping("admin/updateBbs.do")
	public String updateBbs(HttpServletRequest request,BbsWithBLOBs Bbs){
		Timestamp time=new Timestamp(System.currentTimeMillis());
		Bbs.setEtime(time.toString().substring(0,19));
		bbsService.update(Bbs);
		return "redirect:bbsList.do";
	}
	

//	分页查询
	@RequestMapping("admin/bbsList.do")
	public String jianList(ModelMap map,HttpSession session){
		Map<String, Object> pmap=new HashMap<String,Object>();
		List<BbsWithBLOBs> list=bbsService.getAll(pmap);
		map.put("list", list);
		Map<String, Object> umap=new HashMap<String,Object>();
		umap.put("utype", "用户");
		map.put("ulist", userService.getAll(umap));
		return "admin/bbs_list";
	}
//   分页模糊查询
	@RequestMapping("admin/bbsListSearch.do")
	public String bbsListSearch(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Bbs bbs){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		if(bbs.getName()!=null&&!bbs.getName().equals("")){
			pmap.put("name", bbs.getName());
		}
		if(bbs.getUid()!=null&&!bbs.getUid().equals("")){
			pmap.put("uid", bbs.getUid());
		}
		List<BbsWithBLOBs> list=bbsService.getAll(pmap);
		map.put("list", list);
		Map<String, Object> umap = new HashMap<>();
		umap.put("utype", "用户");
		map.put("ulist", userService.getAll(umap));
		return "admin/bbs_list";
	}
	
//  分页模糊查询
	@RequestMapping("showBbs.do")
	public String showBbs(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,int id){
		Bbs bbs=bbsService.getById(id);
		Map<String, Object> bmap=new HashMap<>();
		bmap.put("btype", "回复");
		bmap.put("gid", id);
		List<BbsWithBLOBs> list=bbsService.getAll(bmap);
		session.setAttribute("p", 1);
		map.put("list", list);
		map.put("ulist", userService.getAll(null));
		map.put("bbs", bbs);
		return "bbsx";
	}
	
//  分页模糊查询
	@RequestMapping("showBbs2.do")
	public String showBbs2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Bbs cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		map.put("adlist", typeService.getAll(null));
		return "fwlist";
	}
	
//  分页模糊查询
	@RequestMapping("selectBbsList.do")
	public String SelectBbs(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Bbs cd){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page),PageBean.PAGESIZE);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", pageBean.getPageSize());
		
		Map<String, Object> cmap=new HashMap<String,Object>();
	/*if(cd.getExperience()!=null&&!cd.getExperience().equals("")){
				cmap.put("experience", cd.getExperience());
				pmap.put("experience", cd.getExperience());
			} */
		int total=bbsService.getCount(cmap);
		pageBean.setTotal(total);
		List<BbsWithBLOBs> list=bbsService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 2);
		map.put("adlist", typeService.getAll(null));
		return "fwlist";
	}
	@RequestMapping("admin/deleteBbs.do")
	public String deleteBbs(int id){
		bbsService.delete(id);
		return "redirect:bbsList.do";
	}
}
