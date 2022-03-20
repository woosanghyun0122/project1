package com.project.multimarket.favorite;

import java.util.List;


public interface FavoriteDao {
	
	void insert(FavoriteDto dto);
	List<FavoriteDto> getList(String userid);
	void delete(String favorite_id);
	void deleteAll(String userid);
	int count(FavoriteDto dto);
	boolean isDuplicate(FavoriteDto dto);


}
