package com.project.multimarket.product;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Resource(name="productDao")
	ProductDao productDao;

	@Override
	public List<ProductDto> getList(ProductDto dto) {
		// TODO Auto-generated method stub
		return productDao.getList(dto);
	}

	@Override
	public int getTotal(ProductDto dto) {
		// TODO Auto-generated method stub
		return productDao.getTotal(dto);
	}

	@Override
	public int getSaleTotal(ProductDto dto) {
		// TODO Auto-generated method stub
		return productDao.getSaleTotal(dto);
	}

	@Override
	public ProductDto getView(String num) {
		// TODO Auto-generated method stub
		return productDao.getView(num);
	}

	@Override
	public List<ProductDto> brandList(ProductDto dto) {
		// TODO Auto-generated method stub
		return productDao.brandList(dto);
	}

	@Override
	public int getBrandTotal(ProductDto dto) {
		// TODO Auto-generated method stub
		return productDao.getBrandTotal(dto);
	}

	@Override
	public List<ProductDto> getRelateItems(String num) {
		
		return productDao.getRelateItems(num);
	}

	@Override
	public List<ProductDto> main(String num) {
		// TODO Auto-generated method stub
		return productDao.main(num);
	}


	
	
}
