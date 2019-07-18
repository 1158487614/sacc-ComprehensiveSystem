package com.sacc.ComprehensiveSystem.common.utils;

import org.apache.commons.lang3.StringEscapeUtils;

import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串格式化
 * @author yu.jinbiao
 */
public class StringUtils extends org.apache.commons.lang3.StringUtils{

    /**
     * 将输入的字符串的首字母变成大写
     *
     * @param str
     *            输入的字符串
     * @return 将str的首字母转换成为大写后的结果
     */
    public static String firstUpper(String str) {
        if(null == str || str.length() == 0){
            return "";
        }
        char ch = str.charAt(0);
        ch = Character.toUpperCase(ch);
        return ch + str.substring(1);
    }

    /**
     * 将输入的字符串的首字母变成小写
     *
     * @param str
     *            输入的字符串
     * @return 将str的首字母转换成为小写后的结果
     */
    public static String firstLower(String str) {
        if(null == str || str.length() == 0){
            return "";
        }
        char ch = str.charAt(0);
        ch = Character.toLowerCase(ch);
        return ch + str.substring(1);
    }

    /**
     * 将后面的删除
     * @param content
     * @param toRemove
     * @return
     */
    public static String removeEnd(String content, String toRemove){
        if(content.endsWith(toRemove)){
            return content.substring(0, content.length() - toRemove.length());
        }
        return content;
    }

    /**
     * 将前面的删除
     * @param content
     * @param toRemove
     * @return
     */
    public static String removeBefore(String content, String toRemove){
        if(content.startsWith(toRemove)){
            return content.substring(toRemove.length());
        }
        return content;
    }

    /**
     * 将前后的某字符删除
     * @param content
     * @param toRemove
     * @return
     */
    public static String removeBeforeAndEnd(String content, String toRemove){
        String str = removeBefore(content, toRemove);
        return removeEnd(str, toRemove);
    }

    /**
     * 判断字符串是否为空值
     * @param str
     * @return
     */
    public static boolean isBlank(String str){
        if(null == str || str.trim().length() == 0){
            return true;
        }
        return false;
    }

    /**
     * 判断字符串是否为非空值
     * @param str
     * @return
     */
    public static boolean isNotBlank(String str){
        if(null == str || str.trim().length() == 0){
            return false;
        }
        return true;
    }

    /**
     * 替换掉HTML标签方法
     */
    public static String replaceHtml(String html) {
        if (isBlank(html)){
            return "";
        }
        String regEx = "<.+?>";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(html);
        String s = m.replaceAll("");
        return s;
    }

    /**
     * 缩略字符串（不区分中英文字符）
     * @param str 目标字符串
     * @param length 截取长度
     * @return
     */
    public static String abbr(String str, int length) {
        if (str == null) {
            return "";
        }
        try {
            StringBuilder sb = new StringBuilder();
            int currentLength = 0;
            for (char c : replaceHtml(StringEscapeUtils.unescapeHtml4(str)).toCharArray()) {
                currentLength += String.valueOf(c).getBytes("GBK").length;
                if (currentLength <= length - 3) {
                    sb.append(c);
                } else {
                    sb.append("...");
                    break;
                }
            }
            return sb.toString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "";
    }
}
