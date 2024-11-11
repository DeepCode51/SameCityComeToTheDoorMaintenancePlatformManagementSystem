package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Bbs;
import com.entity.BbsWithBLOBs;

public interface BbsMapper2 {
    int deleteByPrimaryKey(Integer id);

    int insert(BbsWithBLOBs record);

    int insertSelective(BbsWithBLOBs record);

    BbsWithBLOBs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BbsWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BbsWithBLOBs record);

    int updateByPrimaryKey(Bbs record);
    
    public Bbs checkUname(Map<String, Object> uname);
//  查询所有信息
  public List<BbsWithBLOBs> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<BbsWithBLOBs> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<BbsWithBLOBs> select(Map<String, Object> map);
}