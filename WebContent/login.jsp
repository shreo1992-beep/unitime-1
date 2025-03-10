<!DOCTYPE html>
<%--
 * Licensed to The Apereo Foundation under one or more contributor license
 * agreements. See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.
 *
 * The Apereo Foundation licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
--%>
<%@ page language="java" pageEncoding="utf-8" contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@ page import="org.unitime.timetable.ApplicationProperties" %>
<%@page import="org.cpsolver.ifs.util.JProf"%>
<%@page import="java.text.NumberFormat"%>
<%@ taglib uri="http://www.unitime.org/tags-custom" prefix="tt" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.unitime.org/tags-localization" prefix="loc" %>

<HTML>
	<HEAD>
	    <meta charset="UTF-8"/>
	    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
 	   <link type="text/css" rel="stylesheet" href="unitime/gwt/standard/standard.css">
 	   <link type="text/css" rel="stylesheet" href="styles/unitime.css">
 	   <link type="text/css" rel="stylesheet" href="styles/unitime-mobile.css">
 	   <link type="text/css" rel="stylesheet" href="styles/timetabling.css">
 	   <loc:rtl><link type="text/css" rel="stylesheet" href="styles/unitime-rtl.css"></loc:rtl>
		<link rel="shortcut icon" href="images/timetabling.ico" />
	    <script type="text/javascript" language="javascript" src="unitime/unitime.nocache.js"></script>
		<TITLE>UniTime <%=Constants.VERSION%></TITLE>
	</HEAD>
	<BODY class="bodyMain" onload="document.forms[0].username.focus();">
	
	<% if (ApplicationProperties.getProperty("tmtbl.header.external", "").trim().length()>0) { %>
	<jsp:include flush="true" page='<%=ApplicationProperties.getProperty("tmtbl.header.external")%>' />
	<% } %>
	
	<span class='top-menu'>
    	<span id='UniTimeGWT:TopMenu' style="display: block; height: 23px;"></span>
    </span>

	<tt:hasProperty name="tmtbl.global.info">
    	<div class='unitime-PageMessage'><tt:property name="tmtbl.global.info"/></div>
	</tt:hasProperty>
	<tt:hasProperty name="tmtbl.global.warn">
    	<div class='unitime-PageWarn'><tt:property name="tmtbl.global.warn"/></div>
	</tt:hasProperty>
	<tt:hasProperty name="tmtbl.global.error">
    	<div class='unitime-PageError'><tt:property name="tmtbl.global.error"/></div>
	</tt:hasProperty>
	<tt:page-warning prefix="tmtbl.page.warn." style="unitime-PageWarn" page="login"/>
	<tt:page-warning prefix="tmtbl.page.info." style="unitime-PageMessage" page="login"/>
	<tt:page-warning prefix="tmtbl.page.error." style="unitime-PageError" page="login"/>
	
<%
	String errorMsg = null;
	if (request.getParameter("e")!=null) {
		String eNum = request.getParameter("e");
		if (eNum.equals("1"))
			errorMsg = "Invalid username/password";
		if (eNum.equals("2"))
			errorMsg = "Authentication failed";
		if (eNum.equals("3"))
			errorMsg = "Authentication failed";
		if (eNum.equals("4"))
			errorMsg = "User temporarily locked out -<br> Exceeded maximum failed login attempts.";
	} else if (request.getParameter("m")!=null) {
		errorMsg = (String)request.getParameter("m");
	}
 %>		

<script>
function myFunction() {

  var x = document.getElementById("lang").value;
  window.location.href= location.protocol + '//' + location.host + location.pathname+"?locale="+x;

  
}
</script>


<loc:bundle name="CustomMessages">
	
	
	
<FORM name="f" action="<c:url value='login'/>" method="POST">
	<INPUT type="hidden" name="cs" value="login">
	<INPUT type="hidden" name="menu" value="<%=request.getParameter("menu") == null ? "" : request.getParameter("menu") %>">
	<INPUT type="hidden" name="target" value="<%=request.getParameter("target") == null ? "" : request.getParameter("target") %>">
			
	<span class='unitime-Login'>
		<span class="mobile-menu-button" id='UniTimeGWT:MobileMenuButton'></span>
		<span class='logo'><img src="images/unitime.png" border="0" alt="UniTime"></span>
		<span class='header'>
			<div class='h1'><loc:message name="loginh1"/></div>
			<div class='h2'><loc:message name="loginh2"/></div>
		</span>
		<span class="mobile-menu" id='UniTimeGWT:MobileMenuPanel'></span>
		<% if (errorMsg!=null)  { %><div class='error'><%= errorMsg %></div><% } %>
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
			<div class='error'><loc:message name="error_failed"/>: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.</div>
		</c:if>
		<span class='login'>
			<div id="login">
				<div class="BrownBG">
					<div class="H40px"></div>
					<div><label><loc:message name="username"/>:</label></div>
					<div class="txtField"><input type='text' name='username' value='<c:if test="${not empty SPRING_SECURITY_LAST_USERNAME}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>' aria-label='Enter user name'/></div>
					<div class="H20px"></div>
					<div><label><loc:message name="password"/>:</label></div>
					<div class="txtField"><input type='password' name='password' aria-label='Enter password'></div>
				</div>
				<div class="bottom"><img src="images/login_bg_2.jpg"/><input id="submit" name="submit" type="submit" src="images/login_bg_3.jpg" border="0" align="top" value="<loc:message name="login"/>" alt="Submit login information."><img src="images/login_bg_4.jpg"/></div>
			</div>
		</span>
		<c:if test="${SUGGEST_PASSWORD_RESET}">
			<span class='forgot'><a href='gwt.jsp?page=password&reset=1' class='unitime-FooterLink'><loc:message name="login_forgot"/>?</a></span>
		</c:if>
		<label for="language"><loc:message name="chooselanguage"/>:</label>

<select name="lang" id="lang" onchange="myFunction()">
<option value=""></option>
  <option value="en"><loc:message name="english"/></option>
  <option value="ar"><loc:message name="arabic"/></option>
 
</select>
	</span>
</FORM>
</loc:bundle>
		
		<%@ include file="/initializationError.jspf"%>
		
		<span class="unitime-Footer">
			<span class="row">
				<span class="cell middle">
					<span id='UniTimeGWT:Version'></span>
					<tt:copy br="false"/>
				</span>
			</span>
		</span>
		<tt:hasProperty name="tmtbl.page.disclaimer">
			<span class='unitime-Disclaimer'><tt:property name="tmtbl.page.disclaimer"/></span>
		</tt:hasProperty>
		

		<% if (ApplicationProperties.getProperty("tmtbl.footer.external", "").trim().length()>0) { %>
			<jsp:include flush="true" page='<%=ApplicationProperties.getProperty("tmtbl.footer.external")%>' />
		<% } %>
</HTML>
