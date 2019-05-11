package com.uneedcomms.streamdataapi.api.Service;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.rolling.RollingFileAppender;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import java.io.File;
import java.nio.charset.Charset;

//@Service
public class StreamServiceImpl implements StreamService {

    final static Logger logger = LoggerFactory.getLogger(StreamService.class);
    @Value("${log.path}")
    String logPath;

    @Override
    public LoggerContext getLoggerContext(String fileName) {

        LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();

        RollingFileAppender<ILoggingEvent> rollingFileAppender = new RollingFileAppender<>();
        String path = new File(logPath) + "/" + fileName;

        System.out.println(path);

        rollingFileAppender.setContext(loggerContext);
        rollingFileAppender.setFile(path);
        //rollingFileAppender.setRollingPolicy();
        //rollingFileAppender.setTriggeringPolicy();
        PatternLayoutEncoder encoder = new PatternLayoutEncoder();
        encoder.setCharset(Charset.forName("UTF-8"));
        encoder.setOutputPatternAsHeader(false);

        rollingFileAppender.setEncoder(encoder);
        rollingFileAppender.start();

        return loggerContext;
    }
}
