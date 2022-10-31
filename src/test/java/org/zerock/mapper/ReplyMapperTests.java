package org.zerock.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class ReplyMapperTests {
	
	
	private Long[] bnoArr = {227L,226L,225L,224L,223L};
	
	
	
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	

	
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1,10).forEach(i ->{
			
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i % 5]);
			vo.setReply("10-31테스트 댓글" + i);
			vo.setReplyer("replyer"+ i);
			
			mapper.insert(vo);
			
		});
	}
	

	@Test
	public void testRead() {
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo.toString());
		
	
	}
	
	@Test
	public void testMapper() {
		log.info("-------------------------------------------------------------------------");
			
		log.info(mapper.toString());
		
	}
	
	@Test
	public void testDelete() {
		Long targetRno = 1L;
		mapper.delete(targetRno);
		
	}
	
	
	
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria (2,10);
		log.info("98***********************************************************************************************************************");
		List<ReplyVO> replies = mapper.getListWithPaging(cri,142L );
		
		replies.forEach(reply -> log.info(reply.toString()));
		
		
		
		
	}
	
	
	@Test
	public void testUpdate() {
		Long targetRno = 10L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply ");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT : " +count + "=================================================================================");
	}

	
	
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		
		List<ReplyVO> replies = mapper.getListWithPaging(cri, 226L);
		
		replies.forEach(reply ->log.info(reply.toString()));
		
	}

}
