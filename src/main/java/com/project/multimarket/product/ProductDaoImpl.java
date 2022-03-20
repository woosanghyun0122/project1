package com.project.multimarket.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productDao")
public class ProductDaoImpl implements ProductDao{

	@Autowired
	SqlSessionTemplate sm;

	@Override
	public List<ProductDto> getList(ProductDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("Product_getList",dto);
	}

	@Override
	public int getTotal(ProductDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Product_getTotal",dto);
	}

	@Override
	public int getSaleTotal(ProductDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Product_getSaleTotal",dto);
	}

	@Override
	public ProductDto getView(String num) {
		// TODO Auto-generated method stub
		return sm.selectOne("Product_getView",num);
	}

	@Override
	public List<ProductDto> brandList(ProductDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("Product_brand",dto);
	}

	@Override
	public int getBrandTotal(ProductDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Product_getBrandTotal",dto);
	}

	@Override
	public List<ProductDto> getRelateItems(String num) {
		// TODO Auto-generated method stub
		return sm.selectList("Product_getRelatedItems",num);
	}

	@Override
	public List<ProductDto> main(String num) {
		// TODO Auto-generated method stub
		return sm.selectList("Product_main",num);
	}

}
