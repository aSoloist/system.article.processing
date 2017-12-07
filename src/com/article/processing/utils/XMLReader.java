package com.article.processing.utils;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Soloist on 2017/6/9.
 */
class XMLReader {

    static List<String> XMLRead(){
        List<String> info = new ArrayList<>();
        String path = XMLReader.class.getResource("/").getPath() + XMLReader.class.getPackage().getName().replaceAll("\\.", "/");
        File f = new File(path + "/conf.xml");
        DocumentBuilder db;
        DocumentBuilderFactory dbf;
        Document document = null;

        dbf = DocumentBuilderFactory.newInstance();
        try {
            db = dbf.newDocumentBuilder();
            document = db.parse(f);
        } catch (ParserConfigurationException | SAXException | IOException e) {
            e.printStackTrace();
        }

        assert document != null;
        NodeList childNodes = document.getDocumentElement().getChildNodes();

        for (int i = 0; i < childNodes.getLength(); i++){
            Node str = childNodes.item(i);
            info.add(str.getTextContent());
        }

        return info;
    }
}
