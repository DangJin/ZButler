package com.linestore.dao;

import java.util.List;

import com.linestore.util.Page;
import com.linestore.vo.Customer;
import com.linestore.vo.Message;

public interface MessageDao {
	// 获取用户全部留言
	List<Message> selectAll(Message message);

	// 为用户增加一个留言
	void add(Message message);

	// 删除用户指定留言
	void del(Message message);

	List<Message> SelectAll(Page page);

	void del(int id);

	public int queryAll();
	
	public List<Message> search(int type);

}
