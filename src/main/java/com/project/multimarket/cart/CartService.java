package com.project.multimarket.cart;

import java.util.List;

public interface CartService {
	
	List<CartDto> getList(String userid);
	void insert(CartDto dto);
	void delete(String cart_id);
	void deleteAll(String userid);
	void update(CartDto dto);
	void modify(CartDto dto);
	int countCart(CartDto dto);


}
