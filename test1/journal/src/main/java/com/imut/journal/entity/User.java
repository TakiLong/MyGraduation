package com.imut.journal.entity;

import java.util.Date;

public class User {
    private String userId;

    private String userLoginname;

    private String userPasswd;

    private String userRealname;

    private String userSex;

    private Date userBirth;

    private String userPhone;

    private String userAddress;

    private String userEmail;

    private String userRemark;

    private Integer userRoll;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserLoginname() {
        return userLoginname;
    }

    public void setUserLoginname(String userLoginname) {
        this.userLoginname = userLoginname == null ? null : userLoginname.trim();
    }

    public String getUserPasswd() {
        return userPasswd;
    }

    public void setUserPasswd(String userPasswd) {
        this.userPasswd = userPasswd == null ? null : userPasswd.trim();
    }

    public String getUserRealname() {
        return userRealname;
    }

    public void setUserRealname(String userRealname) {
        this.userRealname = userRealname == null ? null : userRealname.trim();
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Date getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(Date userBirth) {
        this.userBirth = userBirth;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress == null ? null : userAddress.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserRemark() {
        return userRemark;
    }

    public void setUserRemark(String userRemark) {
        this.userRemark = userRemark == null ? null : userRemark.trim();
    }

    public Integer getUserRoll() {
        return userRoll;
    }

    public void setUserRoll(Integer userRoll) {
        this.userRoll = userRoll;
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userLoginname=" + userLoginname + ", userPasswd=" + userPasswd
				+ ", userRealname=" + userRealname + ", userSex=" + userSex + ", userBirth=" + userBirth
				+ ", userPhone=" + userPhone + ", userAddress=" + userAddress + ", userEmail=" + userEmail
				+ ", userRemark=" + userRemark + ", userRoll=" + userRoll + "]";
	}
    
}