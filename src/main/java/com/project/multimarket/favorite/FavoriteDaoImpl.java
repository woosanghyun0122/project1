package com.project.multimarket.favorite;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("favoriteDao")
public class FavoriteDaoImpl implements FavoriteDao{

	@Autowired
	SqlSessionTemplate sm;

	@Override
	public void insert(FavoriteDto dto) {
		// TODO Auto-generated method stub
		sm.insert("Favorite_insert",dto);
	}

	@Override
	public List<FavoriteDto> getList(String userid) {
		// TODO Auto-generated method stub
		return sm.selectList("Favorite_getList",userid);
	}

	@Override
	public void delete(String favorite_id) {
		// TODO Auto-generated method stub
		sm.delete("Favorite_delete",favorite_id);
	}

	@Override
	public void deleteAll(String userid) {
		// TODO Auto-generated method stub
		sm.delete("Favorite_deleteall",userid);
	}

	@Override
	public int count(FavoriteDto dto) {
		// TODO Auto-generated method stub
		System.out.println("dddddddd");
		return sm.selectOne("Favorite_getTotal",dto);
	}

	@Override
	public boolean isDuplicate(FavoriteDto dto) {

		int cnt = sm.selectOne("Favorite_isDuplicate",dto);
		
		System.out.println("cnt---------------->"+cnt);
		
		if(cnt==0) {
			return false;
		}
		else {
			return true;
		}
	}
	

	

}
