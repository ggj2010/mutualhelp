package com.ggj.mutualhelp.common.utils;

import java.util.UUID;

import lombok.extern.slf4j.Slf4j;

import org.junit.Test;

@Slf4j
public class Testuuid {
	
	@Test
	public void test() {
		log.info(UUID.randomUUID().toString());
	}
}
