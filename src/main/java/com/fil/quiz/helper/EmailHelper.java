/**
 *
 */
package com.fil.quiz.helper;

import java.io.UnsupportedEncodingException;

import javax.annotation.PostConstruct;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.DependsOn;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import com.fil.quiz.controller.QuizController;

/**
 * @author ManmeetFIL
 *
 */
@Component
@DependsOn("flyway1")
public class EmailHelper {

	@Value("${email.id}")
	private String email;

	@Value("${email.subject}")
	private String subject;

	@Value("${email.name}")
	private String emailName;

	@Value("#{genericDAO.getSystemParameter('SEND_EMAIL')}")
	private String sendEmailFlag;

	@Value("#{genericDAO.getSystemParameter('ACTIVE_SET')}")
	private String activeSet;

	private String emailContent;

	@Autowired
	private JavaMailSender mailSender;

	private static final Logger LOGGER = LoggerFactory.getLogger(QuizController.class);

	@PostConstruct
	public void initIt() throws Exception {
		ClassLoader classLoader = getClass().getClassLoader();
		emailContent = IOUtils.toString(classLoader.getResourceAsStream("EmailContent.html"));
	}

	public void sendEmail(String aNUmber) throws UnsupportedEncodingException {
		LOGGER.info("EMAIL Deliveribility Flag - " + sendEmailFlag);
		if ("TRUE".equalsIgnoreCase(sendEmailFlag)) {
			try {
				MimeMessage message = mailSender.createMimeMessage();
				message.setSubject(subject);
				MimeMessageHelper helper;
				helper = new MimeMessageHelper(message, true);
				helper.setFrom(email, emailName);
				helper.setTo(aNUmber + "@fil.com");
				helper.setText(emailContent, true);
				mailSender.send(message);
			} catch (MessagingException ex) {
				System.err.println(ex);
			}
		}
	}
}
