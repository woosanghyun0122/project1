package com.project.multimarket.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sm;

	@Override
	public boolean isDuplicate(MemberDto dto) {

		int cnt = sm.selectOne("Member_isDuplicate",dto);
		
		System.out.println(cnt);
		
		if(cnt==0) {
			return false;
		}
		else {
			return true;
		}
	}

	@Override
	public void member_insert(MemberDto dto) {
		System.out.println("회원가입2");
		sm.insert("Member_insert",dto);
		
	}

	@Override
	public MemberDto member_getInfo(MemberDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Member_getInfo",dto);
	}

	@Override
	public MemberDto member_findid(MemberDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Member_findid",dto);
	}

	@Override
	public MemberDto member_findpw(MemberDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("Member_findpw",dto);
	}

	@Override
	public void update(MemberDto dto) {
		// TODO Auto-generated method stub
		sm.update("Member_update",dto);
	}
	
	
}
