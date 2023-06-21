package org.openas2.logging;

import org.openas2.OpenAS2Exception;
import org.openas2.Session;
import org.openas2.message.Message;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log4J2Logger extends BaseLogger {

    private Logger logger = LogManager.getLogger(getClass().getName());

    public void init(Session session, Map<String, String> parameters) throws OpenAS2Exception {
        super.init(session, parameters);

        this.setFormatter(new Log4J2Formatter());
    }

    public void doLog(Level level, String msgText, Message as2Msg) {
        appendToFile(level,getFormatter().format(level, msgText + (as2Msg == null?"":as2Msg.getLogMsgID())));
    }

    protected String getShowDefaults() {
        return VALUE_SHOW_ALL;
    }

    protected void appendToFile(Level level, String text) {

        if ( level.getName().equals("error") ) {
            logger.error(text.trim());
        } else if ( level.getName().equals("warning") ) {
            logger.warn(text.trim());
        } else if ( level.getName().equals("finest") ) {
            logger.trace(text.trim());
        } else {
            logger.info(text.trim());
        }
    }

    protected void doLog(OpenAS2Exception exception, boolean terminated) {
        appendToFile(new Level("error"), getFormatter().format(exception, terminated));
    }

    protected void doLog(Throwable t, boolean terminated) {
        // appendToFile(getFormatter().format(t, terminated));
        appendToFile(new Level("error"), getFormatter().format(t, terminated));
    }
}
