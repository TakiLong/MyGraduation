package com.imut.journal.util;/**
 * Created by lizhaoz on 2015/12/1.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.Key;

import javax.servlet.ServletContext;

import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.impl.crypto.MacProvider;
/**
 * @Name:
 * @Author: lizhao（作者）
 * @Version: V1.00 （版本号）
 * @Create Date: 2015-11-26（创建日期）
 * @Description:
 */
public class KeyUtil {
    public static Key getKey(ServletContext context) {
        String path=(context.getRealPath("key"));
        File file=new File(path,"key.txt");
        try {
        if(!file.exists()){
           Key key =MacProvider.generateKey(SignatureAlgorithm.HS512);
            ObjectOutputStream oo = new ObjectOutputStream(new FileOutputStream(file));
            oo.writeObject(key);
            oo.close();
            return key;
        }
        ObjectInputStream ois = null;

            ois = new ObjectInputStream(new FileInputStream(file));

        Key key= (Key) ois.readObject();
            return key;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
