package com.ticket.biz.pwtest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service("PwCheck")
public class PwCheckImpl implements PwCheck{

	@Override
	public String encrypt(String password) {
		return BCrypt.hashpw(password,BCrypt.gensalt());
	}

	@Override
	public boolean isMatch(String password, String hashed) {
		return BCrypt.checkpw(password,hashed);
	}

}
