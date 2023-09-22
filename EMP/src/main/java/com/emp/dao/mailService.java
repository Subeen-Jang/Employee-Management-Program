package com.emp.dao;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.postgresql.translation.messages_bg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.emp.dto.mailDTO;

@Service
public class mailService {
	@Autowired 
	private JavaMailSender mailSender;
	
	public void sendMail(mailDTO dto) throws MessagingException {
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true);
		
		helper.setSubject(dto.getTitle());
		
		helper.setCc(dto.getCcAdress());
		
		helper.setText(dto.getContent(),false);
		
		helper.setFrom("wkdtn134@gmail.com");
		
		helper.setTo(dto.getAddress());
		
		mailSender.send(msg);
		
	}
	
}
