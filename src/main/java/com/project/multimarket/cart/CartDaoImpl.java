package com.project.multimarket.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("cartDao")
public class CartDaoImpl implements CartDao{
	
	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<CartDto> getList(String userid) {
		// TODO Auto-generated method stub
		return sm.selectList("Cart_getList",userid);
	}

	@Override
	public void insert(CartDto dto) {
		// TODO Auto-generated method stub
		sm.insert("Cart_insert",dto);
	}

	@Override
	public void delete(String cart_id) {
		// TODO Auto-generated method stub
		sm.delete("Cart_delete",cart_id);
	}

	@Override
	public void deleteAll(String userid) {
		// TODO Auto-generated method stub
		sm.delete("Cart_deleteall",userid);
	}

	@Override
	public void update(CartDto dto) {
		// TODO Auto-generated method stub
		sm.update("Cart_update",dto);
	}

	@Override
	public void modify(CartDto dto) {
		// TODO Auto-generated method stub
		sm.update("Cart_modify",dto);
	}

	@Override
	public int countCart(CartDto dto) {
		
		return sm.selectOne("Cart_count",dto);
	}

}
