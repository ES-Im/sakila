package com.example.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.example.sakila.controller.OnInterceptor;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@SpringBootApplication
public class SakilaApplication implements WebMvcConfigurer {
	@Autowired private OnInterceptor oninterceptor; 
	@Autowired private OffInterceptor offinterceptor;
	
	
	
	public static void main(String[] args) { 
		SpringApplication.run(SakilaApplication.class, args);
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {	
	
		registry.addInterceptor(oninterceptor).addPathPatterns("/on/**");
		registry.addInterceptor(offinterceptor).addPathPatterns("/off/**");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
	
}

