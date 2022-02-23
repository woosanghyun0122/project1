package com.project.multimarket.member;

public interface MemberDao {
	
	boolean isDuplicate(MemberDto dto);
	void member_insert(MemberDto dto);
	MemberDto member_getInfo(MemberDto dto);
	MemberDto member_findid(MemberDto dto);
	MemberDto member_findpw(MemberDto dto);
	void update(MemberDto dto);

}
