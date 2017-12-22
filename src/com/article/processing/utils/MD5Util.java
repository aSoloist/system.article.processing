package com.article.processing.utils;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Soloist on 2017/12/13 20:56
 */
public class MD5Util {
    private static MessageDigest md5;
    private final static String KEY = "auth-token";
    private final static String KEY2 = "d4sa6d1sa65d4";
    private final static Charset CHARSET = Charset.forName("UTF-8");
    
    static {
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
    
    public static String encrypt2(String message) {
        byte[] b0 = (message + KEY).getBytes(CHARSET);
        byte[] result0 = md5.digest(b0);
        StringBuilder ret = new StringBuilder(b0.length << 1);
        for (byte aByte : result0) {
            ret.append(Character.forDigit((aByte >> 4) & 0xf, 16));
            ret.append(Character.forDigit(aByte & 0xf, 16));
        }
        byte[] b1 = (ret.toString() + KEY2).getBytes(CHARSET);
        byte[] result1 = md5.digest(b1);
        ret = new StringBuilder(b1.length << 1);
        for (byte aByte : result1) {
            ret.append(Character.forDigit((aByte >> 4) & 0xf, 16));
            ret.append(Character.forDigit(aByte & 0xf, 16));
        }
        return ret.toString();
    }

    public static String encrypt(String message) {
        byte[] bytes = (message + KEY).getBytes(CHARSET);
        byte[] result = md5.digest(bytes);
        StringBuilder ret = new StringBuilder(bytes.length << 1);
        for (byte aByte : result) {
            ret.append(Character.forDigit((aByte >> 4) & 0xf, 16));
            ret.append(Character.forDigit(aByte & 0xf, 16));
        }
        return ret.toString();
    }

    public static void main(String[] args) {
        String m = "123546";
        System.out.println(encrypt(m));
    }
}
