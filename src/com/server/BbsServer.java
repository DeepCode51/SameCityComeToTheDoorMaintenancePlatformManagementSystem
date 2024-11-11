package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Bbs;
import com.entity.BbsWithBLOBs;

public interface BbsServer {
//  添加
  public int add(BbsWithBLOBs po);
//  修改
  public int update(BbsWithBLOBs po);
//  删除
  public int delete(int id);
//  查询
  public List<BbsWithBLOBs> getAll(Map<String, Object> map);
//  验证
  public Bbs checkUname(String account);
//  获取对象
  public Bbs getById( int id);
//  分页显示
  public List<BbsWithBLOBs> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  模糊查询
  public List<BbsWithBLOBs> select(Map<String, Object> map);
}
