package com.project.multimarket.product;

import java.util.List;

public interface ProductService {
	
	List<ProductDto> getList(ProductDto dto);
	int getTotal(ProductDto dto);
	int getSaleTotal(ProductDto dto);
	ProductDto getView(String num);
	List<ProductDto>brandList(ProductDto dto);
	int getBrandTotal(ProductDto dto);
	List<ProductDto> getRelateItems(String num);
	List<ProductDto> main(String num);


}
