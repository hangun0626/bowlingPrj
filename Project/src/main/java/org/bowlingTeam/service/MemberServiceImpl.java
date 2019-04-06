package org.bowlingTeam.service;

import org.bowlingTeam.domain.MemberVO;
import org.bowlingTeam.persistence.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO idcheck(String id) {
		return this.memberDAO.idcheck(id);
	}

	/*@Override
	public List<ZipcodeVO> zipFind(String dong) {
		return this.memberDAO.zipFind(dong);
	}*/

	@Override
	public void insertMember(MemberVO m) {
		this.memberDAO.insertMember(m);
	}

	@Override
	public MemberVO pwdMember(MemberVO m) {
		return this.memberDAO.pwdMember(m);
	}

	@Override
	public void updatePwd(MemberVO m) {
		this.memberDAO.updatePwd(m);		
	}

	@Override
	public MemberVO login_check(String login_id) {
		return this.memberDAO.login_Check(login_id);
	}

	@Override
	public MemberVO getMember(String id) {
		return this.memberDAO.getMember(id);
	}

	@Override
	public void updateMember(MemberVO m) {
		this.memberDAO.updateMember(m);		
	}

	@Override
	public void delMem(MemberVO dm) {
		this.memberDAO.delMem(dm);		
	}
}























