package com.softdev.system.generator;

import com.spring4all.swagger.EnableSwagger2Doc;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@EnableSwagger2Doc
@SpringBootApplication
public class GeneratorWebApplication {
	public static void main(String[] args) {
		SpringApplication.run(GeneratorWebApplication.class,args);
	}
}
