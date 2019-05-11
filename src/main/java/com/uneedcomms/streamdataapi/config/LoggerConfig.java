package com.uneedcomms.streamdataapi.config;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.util.ContextInitializer;
import org.slf4j.LoggerFactory;

//@Configuration
public class LoggerConfig {

//    @Bean
    public LoggerContext getLoggerContext(){

        LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
        ContextInitializer contextInitializer = new ContextInitializer(loggerContext);
        return null;
    }
}
