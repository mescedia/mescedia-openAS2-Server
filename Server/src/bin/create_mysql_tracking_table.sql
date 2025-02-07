CREATE TABLE `as2_msg_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MSG_ID` varchar(512) NOT NULL,
  `MDN_ID` text DEFAULT NULL,
  `DIRECTION` varchar(25) DEFAULT NULL,
  `IS_RESEND` varchar(1) DEFAULT 'N',
  `RESEND_COUNT` int(11) DEFAULT 0,
  `SENDER_ID` varchar(255) NOT NULL,
  `RECEIVER_ID` varchar(255) NOT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `SIGNATURE_ALGORITHM` varchar(255) DEFAULT NULL,
  `ENCRYPTION_ALGORITHM` varchar(255) DEFAULT NULL,
  `COMPRESSION` varchar(255) DEFAULT NULL,
  `FILE_NAME` varchar(255) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) DEFAULT NULL,
  `CONTENT_TRANSFER_ENCODING` varchar(255) DEFAULT NULL,
  `MDN_MODE` varchar(255) DEFAULT NULL,
  `MDN_RESPONSE` text DEFAULT NULL,
  `STATE_MSG` text DEFAULT NULL,
  `CREATE_DT` timestamp NOT NULL DEFAULT current_timestamp(),
  `UPDATE_DT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
);
