/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vshu.servlets;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author acer
 */
public class CompValidationServerSide {
     private Pattern cname;
    private Pattern cemail;
    private Pattern cpassword;
    
    private Matcher matcher;
    
    private static final String NAME_PATTERN="^[a-zA-Z ]{3,30}$";
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z-]+(\\.[A-Za-z]+)*(\\.[A-Za-z]{2,3})$";
    private static final String PASS_PATTERN="^[A-Za-z0-9@#_]{6,16}$";
    
    public CompValidationServerSide()
    {
        cname = Pattern.compile(NAME_PATTERN);
        cemail = Pattern.compile(EMAIL_PATTERN);
        cpassword = Pattern.compile(PASS_PATTERN);
    }
    
    public boolean cnameValidate(final String c_name1)
    {
        matcher = cname.matcher(c_name1);
        return matcher.matches();
    }
    
    public boolean cemailValidate(final String c_email1)
    {
        matcher = cemail.matcher(c_email1);
        return matcher.matches();
    }
    
    public boolean cpasswordValidate(final String c_pass1)
    {
        matcher = cpassword.matcher(c_pass1);
        return matcher.matches();
    }
}
