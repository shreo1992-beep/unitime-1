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
<%@ page language="java" autoFlush="true"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.unitime.org/tags-custom" prefix="tt" %>
<%@ taglib uri="http://www.unitime.org/tags-localization" prefix="loc" %>
<tiles:importAttribute />
<loc:bundle name="CourseMessages">
<tt:confirm name="confirmDelete"><loc:message name="MessageOfDeletionConfirmation" /></tt:confirm>

<html:form action="/roomTypeEdit">
<html:hidden property="uniqueId"/><html:errors property="uniqueId"/>
<input type='hidden' name='op2' value=''>
<html:hidden property="canEdit"/>
<logic:notEqual name="roomTypeEditForm" property="op" value="List">
	<TABLE width="100%" border="0" cellspacing="0" cellpadding="3">
		<TR>
			<TD colspan="3">
				<tt:section-header>
					<tt:section-title>
						<logic:equal name="roomTypeEditForm" property="op" value="Save">
						<loc:message name="actionAddRoomTypeToList" />
                                               
						</logic:equal>
						<logic:notEqual name="roomTypeEditForm" property="op" value="Save">
					       <loc:message name="actionEditRoomType" />	
						</logic:notEqual>
					<loc:message name="RoomType" />	
					</tt:section-title>
					<logic:equal name="roomTypeEditForm" property="op" value="Save">
						<html:submit property="op" value="<%=MSG.actionSaveRoomType()%>" accesskey="S" title="Save Room Type (Alt+S)"/>
					</logic:equal>
					<logic:notEqual name="roomTypeEditForm" property="op" value="Save">
						<html:submit property="op" value="<%=MSG.actionUpdateRoomType()%>" accesskey="U" title="Update Room Type (Alt+U)"/>
						<logic:equal name="roomTypeEditForm" property="canEdit" value="true">
							<html:submit property="op" value="<%=MSG.actionDeleteRoomType()%>" onclick="return confirmDelete();" accesskey="D" title="Delete Room Type (Alt+D)"/>
						</logic:equal> 
					</logic:notEqual>
					<html:submit property="op" value="<%=MSG.actionBackToRoomTypeList()%>" title="Return to Room Types (Alt+B)" accesskey="B"/>
				</tt:section-header>
			</TD>
		</TR>

		<TR>
			<TD><loc:message name="Reference" />:</TD>
			<TD colspan='2'>
				<html:text property="reference" size="20" maxlength="20"/>
				&nbsp;<html:errors property="reference"/>
			</TD>
		</TR>

		<TR>
			<TD><loc:message name="Label" />:</TD>
			<TD colspan='2'>
				<html:text property="label" size="60" maxlength="60"/>
				&nbsp;<html:errors property="label"/>
			</TD>
		</TR>

		<logic:equal name="roomTypeEditForm" property="canEdit" value="true">
			<TR>
				<TD><loc:message name="RoomTypeidentifier" />:</TD>
				<TD colspan='2'>
				<html:select property="type">
					<html:option value="0"><loc:message name="prefRoom" /></html:option>
					<html:option value="1"><loc:message name="OtherRoomTypeLocation" /></html:option>
				</html:select>
				&nbsp;<html:errors property="type"/>
			</TR>
		</logic:equal>
		<logic:equal name="roomTypeEditForm" property="canEdit" value="false">
			<html:hidden property="type"/>
		</logic:equal>
		
		<TR>
			<TD colspan='3'>
				<tt:section-title/>
			</TD>
		</TR>
		<TR>
			<TD align="right" colspan="3">
				<logic:equal name="roomTypeEditForm" property="op" value="Save">
					<html:submit property="op" value="<%=MSG.actionSaveRoomType()%>" accesskey="S" title="Save Room Type (Alt+S)"/>
				</logic:equal>
				<logic:notEqual name="roomTypeEditForm" property="op" value="Save">
					<html:submit property="op" value="<%=MSG.actionUpdateRoomType()%>" accesskey="U" title="Update Room Type (Alt+U)"/>
					<logic:equal name="roomTypeEditForm" property="canEdit" value="true">
						<html:submit property="op" value="<%=MSG.actionDeleteRoomType()%>" onclick="return confirmDelete();" accesskey="D" title="Delete Room Type (Alt+D)"/>
					</logic:equal>
				</logic:notEqual>
				<html:submit property="op" value="<%=MSG.actionBackToRoomTypeList()%>" title="Return to Room Types (Alt+B)" accesskey="B"/>
			</TD>
		</TR>
	</TABLE>
</logic:notEqual>
<logic:equal name="roomTypeEditForm" property="op" value="List">
	<TABLE width="100%" border="0" cellspacing="0" cellpadding="3">
		<tr>
			<td colspan='5'>
				<tt:section-header>
					<tt:section-title><loc:message name="propertyRoomTypes"/></tt:section-title>
					<!--<html:submit property="op" value="Add Room Type" accesskey="A" title="Create New Room Type (Alt+A)"/>-->
                                            <html:submit property="op" value="<%=MSG.actionAddRoomType() %>"
                                                accesskey="A"
                                             
                                                title="Create New Room Type (Alt+A)"/>
                                        
				</tt:section-header>

			</td>
		</tr>
		<%= request.getAttribute("RoomType.table") %> 
		<tr>
			<td colspan='5'>
				<tt:section-title/>
			</td>
		</tr>
		<tr>
			<td colspan='5' align="right">
			<!--	<html:submit property="op" value="Add Room Type" accesskey="A" title="Create New Room Type (Alt+A)"/>-->
                                <html:submit property="op" value="<%=MSG.actionAddRoomType() %>"
                                                accesskey="A"

                                                title="Create New Room Type (Alt+A)"/>
			</td>
		</tr>
	</TABLE>
</logic:equal>
</html:form>
</loc:bundle>
