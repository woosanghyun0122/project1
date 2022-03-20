package com.project.multimarket.favorite;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("favoriteService")
public class FavoriteServiceImpl implements FavoriteService{

	@Resource(name="favoriteDao")
	FavoriteDao favoriteDao;
	
	@Override
	public void insert(FavoriteDto dto) {
		// TODO Auto-generated method stub
		favoriteDao.insert(dto);
	}

	@Override
	public List<FavoriteDto> getList(String userid) {
		// TODO Auto-generated method stub
		return favoriteDao.getList(userid);
	}

	@Override
	public void delete(String favorite_id) {
		// TODO Auto-generated method stub
		favoriteDao.delete(favorite_id);
	}

	@Override
	public void deleteAll(String userid) {
		// TODO Auto-generated method stub
		favoriteDao.deleteAll(userid);
	}

	@Override
	public int count(FavoriteDto dto) {
		// TODO Auto-generated method stub
		System.out.println("service count---------->"+favoriteDao.count(dto));
		return favoriteDao.count(dto);
	}

	@Override
	public boolean isDuplicate(FavoriteDto dto) {
		// TODO Auto-generated method stub
		return favoriteDao.isDuplicate(dto);
	}

}
