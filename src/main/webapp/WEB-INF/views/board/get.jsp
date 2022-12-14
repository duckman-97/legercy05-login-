<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec"  %>


  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
      
        <div class="panel-heading">
       
       
     
        
        
        
        
           <div class="panel-body">
                     <div class="form-group">
                     <label>Bno</label>
                     <input class="form-control" name="bno"
                        value='<c:out value="${board.bno}"/>' readonly="readonly">
                     
                     </div>
                     <div class="form-group">
                         <label>Title</label>
                         <input class="form-control" name="title"
                        value='<c:out value="${board.title}"/>' readonly="readonly">
                     </div>
                     <div class="form-group">
                         <label>Text area</label>
                         <textarea class="form-control" rows="3" name="content"
                                readonly="readonly"><c:out value="${board.content}"/></textarea>
                     </div>
                     <div class="form-group">
                         <label>Writer</label>
                         <input class="form-control" name="writer"
                        value='<c:out value="${board.writer}"/>' readonly="readonly">
                     </div>
                     
              
                   
                   <sec:authentication property="principal" var="pinfo" />
                   
                   <sec:authorize access="isAuthenticated()">
                   
                   <c:if test="${pinfo.username eq board.writer}">
                   
                   
                     
                     <button data-oper="modify" class="btn btn-default"
                          onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">Modify</button>
                  </c:if>
                  </sec:authorize>
                  
                     
                     
                     <button data-oper="list"  class="btn btn-info"
                          onclick="location.href='/board/list'">List</button>
                          
                     <form id='operForm' action="/board/modify" method="get">
                       <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
                       <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                       <input type='hidden' name='amount' value='<c:out value="${cri.amount}" />'>
                       <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}" />'>
                       <input type='hidden' name='type' value='<c:out value="${cri.type}" />'>
                     </form>
                     
                
                 
           </div>
           
           
           
        </div>
        
             <div class = 'row'>
                     <div class = "col-lg-12">
                     
                     <div class = "panel panel-default">
                     
                     <div class = "panel-heading">
                     
                     <i class = "fa fa-comments fa-fw"></i> Reply
                     <sec:authorize access="isAuthenticated()">
                      <button id = 'addReplyBtn' class = 'btn btn-primary btn-xs pull-right'>New reply</button>
                     </sec:authorize>
                     
                     </div>
                     
                    
                     
                     
                     <div class ="panel-body">
                     <ul class ="chat">
                     <li class = "left clearfix" data-rno='12'>
                     <div>
                     <div class="header">
                     <strong class = "primary-font">user00</strong>
                     <small class = "pull-right text-muted">2018-01-01 13:13</small>
                     
                     </div>
                     <p>Goot job!!</p>
                     </div>
                     
                     </li>
                     </ul>
                     
                     
                     
                     
                     
                     </div>
                     <div class = "panel-footer">
                  
                     
                     
                     </div>
                     
                     
                     </div>
                     
                     </div>
                     
                     </div>
     </div>
  </div>
  


<!-- - Modal -->

<div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog"
aria-labelledby = "myModalLabel" aria-hidden="true">
<div class = "modal-dialog">
<div class = "modal-content">
<div class = "modal-header">
<button type = "button" class = "close" data-dismiss = "modal"
aria-hidden = "true">&times;</button>



<h4 class = "modal-title" id = "myModaLabel">REPLY MODAL</h4>


</div>
<div class = "modal-body">
<div class = "form-group">

<label>Reply</label>

<input class= "form-control" name = 'reply' value= 'New Reply!!!'>

</div>
<div class = "form-group">
<label>Replyer</label>
<input class = "form-control" name = 'replyer' value = 'replyer'  readonly="readonly">


</div>

<div class = "form-group">

<label>Reply Date</label>
<input class = "form-control" name = "replyDate" value= ''>



</div>

</div>


<div class = "modal-footer">
<button id = 'modalModBtn' type = "button" class= "btn btn-warning">Modify</button>
<button id = 'modalRemoveBtn' type = "button" class = "btn btn-danger">Remove</button>


<button id = 'modalRegisterBtn' type = 'button' class = 'btn btn-primary' data-dismiss = 'modal'>regist</button>
<button id = 'modalCloseBtn' type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>



</div>  </div>
</div>
</div>
  
<!--  MOdal close -->
  
  
  <script type = "text/javascript" src = "/resources/js/reply.js"></script>
  
  
  
  
  
  
  <script>
  $(document).ready(function(){
	
	  var bnoValue = '<c:out value="${board.bno}"/>';
	  
	  var replyUL = $(".chat");
	  
	  showList(1);
	  
	  function showList(page){
		  
		  replyService.getList({bno:bnoValue,page:page||1},function(replyCnt,list){
			  
			  console.log("replyCnt : " + replyCnt);
			  console.log("list: " + list);
			  console.log(list);
			  
			  if(page == -1){
				  pageNum = Math.ceil(replyCnt/10.0);
				  showList(pageNum);
				  return;
				  
				  
			  }
			  
			  var str="";
			  
			  if(list==null|| list.length==0){
				  return;
				  
			  }
			  
			  
			
			

			
			for(var i =0,len = list.length|| 0; i<len;i++){
				str +="<li class = 'left clearfix' data-rno= '" + list[i].rno+"'>";
				str +=" <div><div class='header'><strong class = 'primary-font'>" + list[i].replyer+"</strong>";
				
				str+="<small class = 'pull-right text-muted'>" +replyService.displayTime(list[i].replyDate) +"</small></div>";
				
				
				
				str +="  <p>" + list[i].reply + "</p></div></li>";
			}
			
			
			replyUL.html(str);
			
			showReplyPage(replyCnt);
			
			  
		  });
	  }
	  
	  
	  var modal = $(".modal");
	  var modalInputReply = modal.find("input[name = 'reply']");
	  var modalInputReplyer = modal.find("input[name='replyer']");
	  var modalInputReplyDate = modal.find("input[name='replyDate']");
	  
	  var modalModBtn = $("#modalModBtn");
	  var modalRemoveBtn = $("#modalRemoveBtn");
	  var modalRegisterBtn = $("#modalRegisterBtn");
	  
	  var replyer = null;
	  
	 <sec:authorize access="isAuthenticated()">
	  
	  replyer = '<sec:authentication property="principal.username"/>';
	  
	  </sec:authorize>

	  
	  var csrfHeaderName = "${_csrf.headerName}";
	  var csrfTokenValue = "${_csrf.token}";
	  

		
		
	  
	  $("#addReplyBtn").on("click",function(e){
		
		  modal.find("input").val("");
		  modal.find("input[name='replyer']").val(replyer);
		  modalInputReplyDate.closest("div").hide();
		  modal.find("button[id !='modalCloseBtn']").hide();
		  
		  
		  modalRegisterBtn.show();
		  
		  $(".modal").modal("show");
		  
		  
	  });
	  
	  
	  
	  
	  $(document).ajaxSend(function(e,xhr,options){
		
		  xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
		  
		  
	  });
	  
	  
	  
	  
	  
	  modalRegisterBtn.on("click",function(e){
		  
	  var reply = {
			  
			  reply:modalInputReply.val(),
			  replyer:modalInputReplyer.val(),
			  bno:bnoValue
	  };
	  
	  replyService.add(reply,function(result){
		  
	  alert(result);
	  
	  modal.find("input").val("");
	  modal.modal("hide");
	  
	  showList(1);
	  
	  });
	  
	  
	  
	  });
	  
	  
	  
	  
	  $(".chat").on("click","li",function(e){
		var rno = $(this).data("rno");
		
		replyService.get(rno,function(reply){
			
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
			.attr("readonly","readonly");
			modal.data("rno",reply.rno);
			
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
			
			
		});
		
		  
		  
	  });
	  
	  
	  modalModBtn.on("click",function(e){
		  
		  var originalReplyer = modalInputReplyer.val();
		  
		  
		  
		  
	
		  
		  
		  
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val(),replyer:originalReplyer};
		
		
		
		
		
		
		if(!replyer){
			alert("????????? ??? ????????? ???????????????.");
			modal.modal("hide");
			return;
		}
		
		console.log("Origianl Replyer: " + originalReplyer);
		
		if(replyer != originalReplyer){
			alert(result);
			modal.modal("hide");
			return;
		}
		
		
		
		replyService.update(reply,function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
			
		});
		  
		  
	  });
	  
	  
	  modalRemoveBtn.on("click",function(e){
		var rno = modal.data("rno");
		
		
		console.log("RNO: " + rno)
		console.log("REPLYER: " + replyer);
		
		
		
		
		
		
		if(!replyer){
			alert("????????? ??? ????????? ???????????????.");
			modal.modal("hide");
			return;
		}
		
		var originalReplyer = modalInputReplyer.val();
		
		console.log("Original Replyer: " +originalReplyer);
		
		
		if(replyer != originalReplyer){
			alert("????????? ????????? ????????? ????????? ???????????????.");
			modal.modal("hide");
			return;
		}
		
	
		
		
		
		
		replyService.remove(rno,originalReplyer,function(result){
			
			alert(result);
			modal.modal("hide");
			showList(pageNum);
			
			
			
		});
		
		
		
		
		  
	  });
	  

	  var pageNum = 1;
	  var replyPageFooter = $(".panel-footer");
	  
	  function showReplyPage(replyCnt){
		  var endNum = Math.ceil(pageNum/ 10.0)*10;
		  var startNum = endNum - 9;
		  
		  
		  
		  var prev = startNum !=1;
		  var next = false;
		  
		  if (endNum * 10 >= replyCnt){
			  endNum = Math.ceil(replyCnt/10.0);
			  
			  
		  }
		  
		  
		  if(endNum * 10 < replyCnt){
			  next  = true;
			  
		  }	  
		  
		  
		  var str = "<ul class = 'pagination pull-right'>";
		  
		  
		  if(prev){
			  
			  str+="<li class = 'page-item'><a class = 'page-link' href= '"+(startNum - 1)+ "'>Previous</a></li>";
			  
			  
			  
			  
			  
		  }
		  
		  
		  for(var i = startNum; i <= endNum; i++){
			  
			  var active = pageNum ==i? "active":"";
			  
			  
			  str += "<li class = 'page-item " + active+ " '><a class = 'page-link' href = '" +i +"'>"+i+"</a></li>";
			  
			  
		  }
		  
		  if(next){
			  
			  str += "<li class = 'page-item'><a class = 'page-link' href='" + (endNum +1)+"'>Next</a></li>";
			  
		  }
		  
		  str += "</ul></div>";
		  
		  console.log(str);
		  
		  
		  replyPageFooter.html(str);
		  

		  
		  
		  
	  }
	  
	  
	  replyPageFooter.on("click","li a " ,function(e){
		
		  e.preventDefault();
		  console.log("page click");
		  
		  
		  var targetPageNum = $(this).attr("href");
		  
		  console.log("targetPageNum: " + targetPageNum);
		  
		  pageNum = targetPageNum;
		  
		  showList(pageNum);
		  
		  
		  
	  });
	  
	  
	  
	 
	  
	  
	  
	  
	  

	  
	  
  });
  
  </script>




  
  <script type = "text/javascript">
  
	  console.log("=========================");
	  console.log("JS TEST");
	  
	  
	  var bnoValue = '<c:out value = "${board.bno}"/>';
	  
	  
	  replyService.getList({bno:bnoValue, page:1}, function(list){
		for(var i = 0, len = list.length||0; i<len;i++){  			
			console.log(list[i]);
			
		}
	  });
	  
	  
	  /*
	  replyService.add(
			  {reply:"JS Test",replyer:"tester",bno:bnoValue}
	  ,
	  function(result){
		  alert("RESULT: " + result);
		  }
  );*/
  </script>
  
<!-- 
  <script type = "text/javascript">
  replyService.remove(43,function(count){
	  console.log(count);
	  
	  if(count==="success"){
		  alert("REMOVED");
	  }
	  
  },function(err){
	  
	  alert('ERROR...');
  });
  </script>
  
  -->
  
  <!-- >
 
  <script type = "text/javascript">
  replyService.update({
	rno:46,
	bno:bnoValue,
	reply:"Modifyed Reply....."
  },
  function(result){
	  alert("?????? ??????...");
  
  })
  
</script>
 --


  
  <!--  -->
<script type="text/javascript">
replyService.get(51,function(data){
	console.log(data);
})

</script>
  

  
  
  
  
  <script type="text/javascript">
    $(document).ready(function() {
    	var operForm = $("#operForm");
    })
    	$("button[data-oper='modify']").on("click", function(e) {
    		operForm.attr("action", "/board/modify").submit();
    	});
    	
    	$("button[data-oper='list']").on("click", function(e) {
    		operForm.find("#bno").remove();
    		operForm.attr("action", "/board/list");
    		operForm.submit();
    	});
  
  </script>
  

  
  
  
  
  
  
  
  
  
  
<%@ include file="../includes/footer.jsp"  %>