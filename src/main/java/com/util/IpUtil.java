package com.util;

/**
 * Created by T.a.b
 * Date:2021/10/1
 * Time: 16:32
 */
import netscape.javascript.JSObject;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.*;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class IpUtil {
    private static final String[] HEADERS = {
            "X-Forwarded-For",
            "Proxy-Client-IP",
            "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR",
            "HTTP_X_FORWARDED",
            "HTTP_X_CLUSTER_CLIENT_IP",
            "HTTP_CLIENT_IP",
            "HTTP_FORWARDED_FOR",
            "HTTP_FORWARDED",
            "HTTP_VIA",
            "REMOTE_ADDR",
            "X-Real-IP"
    };

    /**
     * 判断ip是否为空，空返回true
     * @param ip
     * @return
     */
    public static boolean isEmptyIp(final String ip){
        return (ip == null || ip.length() == 0 || ip.trim().equals("") || "unknown".equalsIgnoreCase(ip));
    }


    /**
     * 判断ip是否不为空，不为空返回true
     * @param ip
     * @return
     */
    public static boolean isNotEmptyIp(final String ip){
        return !isEmptyIp(ip);
    }

    /***
     * 获取客户端ip地址(可以穿透代理)
     * @param request HttpServletRequest
     * @return
     */
    public static String getIpAddress(HttpServletRequest request) {
        String ip = "";
        for (String header : HEADERS) {
            ip = request.getHeader(header);
            if(isNotEmptyIp(ip)) {
                break;
            }
        }
        if(isEmptyIp(ip)){
            ip = request.getRemoteAddr();
        }
        if(isNotEmptyIp(ip) && ip.contains(",")){
            ip = ip.split(",")[0];
        }
        if("0:0:0:0:0:0:0:1".equals(ip)){
            ip = "127.0.0.1";
        }
        return ip;
    }


    /**
     * 获取本机的局域网ip地址，兼容Linux
     * @return String
     * @throws Exception
     */
    public String getLocalHostIP() throws Exception{
        Enumeration<NetworkInterface> allNetInterfaces = NetworkInterface.getNetworkInterfaces();
        String localHostAddress = "";
        while(allNetInterfaces.hasMoreElements()){
            NetworkInterface networkInterface = allNetInterfaces.nextElement();
            Enumeration<InetAddress> address = networkInterface.getInetAddresses();
            while(address.hasMoreElements()){
                InetAddress inetAddress = address.nextElement();
                if(inetAddress != null && inetAddress instanceof Inet4Address){
                    localHostAddress = inetAddress.getHostAddress();
                }
            }
        }
        return localHostAddress;
    }

    /**
     * 获取外网ip
     * @return String
     */
    public static String getV4IP() throws IOException {
        String ip = "";
        String chinaz = "https://www.ip138.com/";
        String inputLine = "";
        String read = "";
        BufferedReader in=null;
        try {
            URL url = new URL(chinaz);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"utf-8"));
            while ((read = in.readLine()) != null) {
                inputLine += read;
            }
            System.out.println(inputLine);

        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            in.close();
        }
        //正则匹配标签，注意\\
        Pattern p = Pattern.compile("\\<p>你的外网IP地址是：(.*?)\\<\\/p>");
        Matcher m = p.matcher(inputLine);
        if(m.find()){
            ip = m.group(1);
        }
        System.out.println("你的ip为："+ip);
        return ip;

    }

    public String getipjson(String ip) throws IOException {
        String url="https://api.ip138.com/ip/?ip="+ip+"&datatype=jsonp&token=1ec1489ac9367a658e06d41137f79b4c";
        String line="";
        String buffer="";
        BufferedReader in1 = null;
        String result="";
        HttpURLConnection urlConnection = null;
        try {
            URL url1=new URL(url);
             urlConnection = (HttpURLConnection) url1.openConnection();
            urlConnection.connect();
            in1 = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(),"utf-8"));
           while ((line=in1.readLine())!=null){
                  buffer+=line;
           }


        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
           in1.close();
           urlConnection.disconnect();

        }
        JsonUtil jsonUtil=new JsonUtil();
        result=jsonUtil.ipjson(buffer);
        return result;
    }
}