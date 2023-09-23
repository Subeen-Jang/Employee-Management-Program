package com.emp.dao;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.io.IOUtils;
import org.postgresql.translation.messages_bg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.emp.dto.mailDTO;

@Service
public class mailService {
	@Autowired 
	private JavaMailSender mailSender;
	
	public void sendMail(mailDTO dto,MultipartFile file) throws MessagingException, IOException {
		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(msg, true);
		
		helper.setSubject(dto.getTitle());
		
		helper.setCc(dto.getCcAdress());
		
		helper.setText(dto.getContent(),false);
		
		helper.setFrom("wkdtn134@gmail.com");
		
		helper.setTo(dto.getAddress());
		
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		helper.addAttachment(MimeUtility.encodeText(fileName,"UTF-8","B"), new ByteArrayResource(IOUtils.toByteArray(file.getInputStream())));
		mailSender.send(msg);
		
	}
	
}
