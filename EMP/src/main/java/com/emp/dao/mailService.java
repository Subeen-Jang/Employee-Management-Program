package com.emp.dao;

import org.postgresql.translation.messages_bg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.emp.dto.mailDTO;

@Service
public class mailService {
	@Autowired 
	private JavaMailSender mailSender;
	
	public void sendMail(mailDTO dto) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setFrom("wkdtn134@gmail.com");
		msg.setTo(dto.getAddress());
		msg.setSubject(dto.getTitle());
		msg.setText(dto.getContent());
		mailSender.send(msg);
	}
	
}
