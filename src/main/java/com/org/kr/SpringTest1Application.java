package com.org.kr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@ComponentScan("com.org.kr.controller")
@SpringBootApplication
public class SpringTest1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringTest1Application.class, args);
	}

}

 