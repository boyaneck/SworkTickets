package com.ticket.biz.pwtest;

public interface PwCheck {
String encrypt(String password);
boolean isMatch(String password, String hashed);
}
