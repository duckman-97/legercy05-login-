<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file = "../includes/header.jsp" %>
  

  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default">
        <div class="panel-heading">Board Register</div>
           <div class="panel-body">
                  <form role="form" action="/board/register" method="post">
                  <input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}"/>
                   <div class="form-group">
                         <label>Title</label>
                         <input class="form-control" name="title">
                     </div>
                   
                     <div class="form-group">
                         <label>Text Area</label>
                         <textarea class="form-control" rows="3" name="content"></textarea>
                     </div>
                       <div class="form-group">
                     
                         <label>Writer</label>
                         <input class="form-control" name="writer" value = '<sec:authentication property="principal.username"/>' readonly="readonly">
                     </div>
                     <button type="submit"  class="btn btn-default">Submit Button</button>
                     <button type="reset"  class="btn btn-default">Reset Button</button>
                  </form>
           </div>
        </div>
     </div>
  </div>
<%@ include file="../includes/footer.jsp"  %>