package com.uneedcomms.streamdataapi.api.Service;

import ch.qos.logback.classic.LoggerContext;

public interface StreamService {
    LoggerContext getLoggerContext(String fileName);
}
