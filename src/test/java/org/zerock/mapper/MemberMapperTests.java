package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Slf4j
public class MemberMapperTests {
	
	@Setter(onMethod_= @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testRead() {
		
		MemberVO vo = mapper.read("admin90");
		
		log.info(vo.toString());
		
		vo.getAuthList().forEach(authVO->log.info(authVO.toString()));
		
	}

}
