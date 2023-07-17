package com.DAO;


import com.entity.User;

public interface UserDAO {
	public boolean userRegister(User us) ;
	public boolean updateProfile(User us) ;
	public User userLogin(String email, String password) ;
	public boolean checkUser(String email) ;
	
	
}
