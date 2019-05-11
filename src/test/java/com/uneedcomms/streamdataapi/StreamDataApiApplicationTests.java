package com.uneedcomms.streamdataapi;

import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.rolling.RollingFileAppender;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Maps;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE)
public class StreamDataApiApplicationTests {

    @Autowired
    ObjectMapper objectMapper;

    @Value("${log.path}")
    String logPath;

//    @Test
    public void contextLoads() throws IOException {

        LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
        loggerContext.setName("stream");

        RollingFileAppender<ILoggingEvent> rollingFileAppender = new RollingFileAppender<>();

        String filename = "sample02.log";
        String path = new File(logPath) + "/" + filename;
        System.out.println("path: "+path);

        rollingFileAppender.setName("file-engine");
        rollingFileAppender.setContext(loggerContext);
        rollingFileAppender.setFile(path);
        //rollingFileAppender.setRollingPolicy();
        //rollingFileAppender.setTriggeringPolicy();
        PatternLayoutEncoder encoder = new PatternLayoutEncoder();
        encoder.setCharset(Charset.forName("UTF-8"));
        encoder.setOutputPatternAsHeader(false);

        rollingFileAppender.setEncoder(encoder);
        rollingFileAppender.start();


        Map<String, Object> requestMap = Maps.newHashMap();
        requestMap.put("foo","bar");
        requestMap.put("name","Jayden");
        Map<String, Object> innerMap = Maps.newHashMap();
        innerMap.put("inner foo","inner bar");
        innerMap.put("inner name", "inner Jayden");
        requestMap.put("inner",innerMap);

        String message = objectMapper.writeValueAsString(requestMap);
        System.out.println(message);

        System.out.println(loggerContext.getLoggerList());

        //Logger logger = loggerContext.exists("stream");
        //Logger logger = (Logger) LoggerFactory.getLogger("stream");
        //logger.debug("message: "+message);
        //StatusPrinter.print(loggerContext);
    }

    @Test
    public void dynamicFileLogTest() throws JoranException {
        LoggerContext context = (LoggerContext) LoggerFactory.getILoggerFactory();
        JoranConfigurator jc = new JoranConfigurator();
        jc.setContext(context);
        context.reset(); // override default configuration
// inject the name of the current application as "application-name"
// property of the LoggerContext
        context.putProperty("shop-name", "uneedcomms");
        jc.doConfigure("logback.xml");

        Logger logger = context.getLogger(StreamDataApiApplicationTests.class);
        logger.debug("동적변경!");

    }

}
