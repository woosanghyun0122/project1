package com.project.multimarket.cart;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService{

	@Resource(name="cartDao")
	CartDao cartDao;
	
	@Override
	public List<CartDto> getList(String userid) {
		// TODO Auto-generated method stub
		return cartDao.getList(userid);
	}

	@Override
	public void insert(CartDto dto) {
		// TODO Auto-generated method stub
		cartDao.insert(dto);
	}

	@Override
	public void delete(String cart_id) {
		// TODO Auto-generated method stub
		cartDao.delete(cart_id);
	}

	@Override
	public void deleteAll(String userid) {
		// TODO Auto-generated method stub
		cartDao.deleteAll(userid);
	}

	@Override
	public void update(CartDto dto) {
		// TODO Auto-generated method stub
		cartDao.update(dto);
	}

	@Override
	public void modify(CartDto dto) {
		// TODO Auto-generated method stub
		cartDao.modify(dto);
	}

	@Override
	public int countCart(CartDto dto) {
		// TODO Auto-generated method stub
		return cartDao.countCart(dto);
	}

}
