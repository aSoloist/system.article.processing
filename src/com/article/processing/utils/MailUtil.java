package com.article.processing.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

/**
 * Created by Soloist on 2017/12/13 18:29
 */
public class MailUtil {
    static {
        PropertiesUtil.load("mail.properties");
    }

    private final static String HOST = PropertiesUtil.get("HOST");
    private final static String PORT = PropertiesUtil.get("PORT");
    private final static String FROM = PropertiesUtil.get("FROM");
    private final static String PASSWORD = PropertiesUtil.get("PASSWORD");
    private final static String NICKNAME = PropertiesUtil.get("NICKNAME");
    private final static String ENCODING = PropertiesUtil.get("ENCODING");
    private final static String CLASS = PropertiesUtil.get("CLASS");
    private final static String FALLBACK = PropertiesUtil.get("FALLBACK");
    private final static String TYPE = PropertiesUtil.get("TYPE");

    private static Properties properties = new Properties();
    private static Session session;

    static {
        properties.setProperty("mail.smtp.host", HOST);
        properties.setProperty("mail.smtp.port", PORT);
        properties.setProperty("mail.smtp.socketFactory.class", CLASS);
        properties.setProperty("mail.smtp.socketFactory.fallback", FALLBACK);
        properties.setProperty("mail.smtp.socketFactory.port", PORT);
        session = Session.getInstance(properties);
        session.setDebug(true);
    }

    /**
     * 发送邮件
     *
     * @param email    目标邮箱
     * @param username 目标姓名
     * @param subject  邮件标题
     * @param message  邮件内容
     */
    public static void sendMail(String email, String username, String subject, String message) throws UnsupportedEncodingException, MessagingException {
        MimeMessage mimeMessage = createMessage(email, username, subject, message);
        Transport transport = session.getTransport();
        transport.connect(FROM, PASSWORD);
        transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
        transport.close();
    }

    private static MimeMessage createMessage(String TO, String username, String subject, String message) throws UnsupportedEncodingException, MessagingException {
        MimeMessage mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress(FROM, NICKNAME, ENCODING));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(TO, username, ENCODING));
        mimeMessage.setSubject(subject);

        MimeMultipart mimeMultipart = new MimeMultipart();
        BodyPart bodyPart = new MimeBodyPart();
        bodyPart.setContent(message, TYPE);
        mimeMultipart.addBodyPart(bodyPart);
        
        mimeMessage.setContent(mimeMultipart);
        mimeMessage.setSentDate(new Date());
        mimeMessage.saveChanges();
        return mimeMessage;
    }
    
    /*public static void main(String[] args) throws UnsupportedEncodingException, MessagingException {
        *//*properties.setProperty("mail.smtp.host", HOST);
        properties.setProperty("mail.smtp.port", PORT);
        properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.setProperty("mail.smtp.socketFactory.fallback", "false");
        properties.setProperty("mail.smtp.socketFactory.port", PORT);*//*

        session.setDebug(true);
        MimeMessage message = createMessage("Soloist1511@gmail.com", "测试用户", "测试", "这是一封测试邮件");
        Transport transport = session.getTransport();
        transport.connect(FROM, PASSWORD);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }*/
}

