package com.project.multimarket.member;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name="memberDao")
	MemberDao memberDao;

	@Override
	public boolean isDuplicate(MemberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.isDuplicate(dto);
	}

	@Override
	public void member_insert(MemberDto dto) {
		// TODO Auto-generated method stub
		memberDao.member_insert(dto);
	}

	@Override
	public MemberDto member_getInfo(MemberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.member_getInfo(dto);
	}

	@Override
	public MemberDto member_findid(MemberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.member_findid(dto);
	}

	@Override
	public MemberDto member_findpw(MemberDto dto) {
		// TODO Auto-generated method stub
		return memberDao.member_findpw(dto);
	}

	@Override
	public void update(MemberDto dto) {
		// TODO Auto-generated method stub
		memberDao.update(dto);
	}
	
	
}
