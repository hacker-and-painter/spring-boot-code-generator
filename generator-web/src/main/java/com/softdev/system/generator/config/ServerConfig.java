package com.softdev.system.generator.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * @Description 通过实现ApplicationListener接口动态获取tomcat启动端口，再通过InetAddress类获取主机的ip地址，最后控制台打印项目访问地址
 * @Author Gao Hang Hang
 * @Date 2019-12-27 14:37
 **/
@Component
@Slf4j
public class ServerConfig implements ApplicationListener<WebServerInitializedEvent> {

    // tomcat启动端口
    private int serverPort;

    public int getPort() {
        return this.serverPort;
    }

    @Override
    public void onApplicationEvent(WebServerInitializedEvent event) {
        try {
            InetAddress inetAddress = Inet4Address.getLocalHost();
            this.serverPort = event.getWebServer().getPort();
            log.info("项目启动启动成功！访问地址: http://{}:{}", inetAddress.getHostAddress(), serverPort);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }

}
