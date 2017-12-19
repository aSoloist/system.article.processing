package com.article.processing.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Soloist on 2017/12/13 20:56
 */
public class MD5Util {
    private static MessageDigest md5;
    private final static String KEY = "auth-token";
    
    static {
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
    
    public static String encrypt(String message) {
        byte[] bytes = new byte[0];
        try {
            bytes = (message + KEY).getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        byte[] result = md5.digest(bytes);
        StringBuilder ret = new StringBuilder(bytes.length<<1);
        for (byte aByte : result) {
            ret.append(Character.forDigit((aByte >> 4) & 0xf, 16));
            ret.append(Character.forDigit(aByte & 0xf, 16));
        }
        return ret.toString();
    }

    /*public static void main(String[] args) {
        String m = "123546";
        System.out.println(encrypt(m));
    }*/
}
