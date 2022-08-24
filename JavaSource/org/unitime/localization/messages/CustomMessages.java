/*
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
*/
package org.unitime.localization.messages;

/**
 * @author Tomas Muller
 */
public interface CustomMessages extends Messages {
	
	@DefaultMessage("User Name")
	String username();

	@DefaultMessage("Password")
	String password();

	@DefaultMessage("Login")
	String login();
	
	@DefaultMessage("Choose Language")
	String chooselanguage();
	
	@DefaultMessage("Arabic")
	String arabic();
	
	@DefaultMessage("English")
	String english();
	
	@DefaultMessage("University Timetabling")
	String loginh1();
	
	@DefaultMessage("Comprehensive Academic Scheduling Solutions")
	String loginh2();
	
	@DefaultMessage("Authentication failed")
	String error_failed();
	
	@DefaultMessage("Forgot your password")
	String login_forgot();
	
	@DefaultMessage("University Timetabling Application")
	String University_timetabling_application();
	
	@DefaultMessage("System Messages")
	String system_messages();
	
	
	

}