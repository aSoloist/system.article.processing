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
    private final static Charset CHARSET = Charset.forName("UTF-8");
    private final static byte[] KEYBYTES = KEY.getBytes(CHARSET);

    public static String encode(String message) {
        byte[] bytes = message.getBytes(CHARSET);
        for (int i = 0; i < bytes.length; i++) {
            for (byte b : KEYBYTES) {
                bytes[i] = (byte) (bytes[i] ^ b);
            }
        }
        return new String(bytes);
    }

    public static String decode(String message) {
        byte[] bytes = message.getBytes(CHARSET);
        byte[] dec = bytes;
        for (int i = 0; i < bytes.length; i++) {
            for (byte b : KEYBYTES) {
                bytes[i] = (byte) (dec[i] ^ b);
            }
        }
        return new String(bytes);
    }

    public static String encrypt(String message) {
        byte[] bytes = (message + KEY).getBytes(CHARSET);
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
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
