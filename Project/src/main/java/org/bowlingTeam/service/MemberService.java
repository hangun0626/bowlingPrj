package org.bowlingTeam.service;

import org.bowlingTeam.domain.MemberVO;

public interface MemberService {

	MemberVO idcheck(String id);
	/*List<ZipcodeVO> zipFind(String dong);*/
	void insertMember(MemberVO m);
	MemberVO pwdMember(MemberVO m);
	void updatePwd(MemberVO m);
	MemberVO login_check(String login_id);
	MemberVO getMember(String id);
	void updateMember(MemberVO m);
	void delMem(MemberVO dm);
    
}
