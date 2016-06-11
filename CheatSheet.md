# ShutItFile Cheat Sheet

<table>
<tr><td><b>Command</b></td><td><b>Description</b></td></tr>
<tr><td> DELIVERY <arg>             </td><td>ShutIt delivery type (bash, docker) </td></tr>
<tr><td> MODULE_ID <arg>            </td><td>A unique identifying string for this module, eg com.mycorp.myproject.mymodule </td></tr>
<tr><td> MAINTAINER <arg>           </td><td>Maintainer of the ShutIt module that is created </td></tr>
<tr><td> INSTALL <arg>              </td><td>Install a package. Figures out local package manager </td></tr>
<tr><td> REMOVE <arg>               </td><td>Remove a package. Figures out local package manager </td></tr>
<tr><td> SEND <arg>                 </td><td>String to input at terminal </td></tr>
<tr><td> RUN <arg>                  </td><td>See SEND </td></tr>
<tr><td> EXPECT <arg>               </td><td>Continue if the specified regexp is seen in the output </td></tr>
<tr><td> EXPECT_MULTI <arg>         </td><td>EXPECT_MULTI ['sername=myuser','assword=mypass']</td></tr>
<tr><td> ASSERT_OUTPUT <arg>        </td><td>If the output from the previous command does not match, then throw an error </td></tr>
<tr><td> UNTIL <arg>                </td><td>Send the previous command until the specified regexp is seen in the output </td></tr>
<tr><td> GET_PASSWORD <arg>         </td><td>Get a password from the user where appropriate.  Only allowed after a LOGIN or USER line. <arg> is the prompt the user sees eg 'Input the password' </td></tr>
<tr><td> ENV <name>=<value>         </td><td>Exports a variable in the local build context </td></tr>
<tr><td> DEPENDS <arg>              </td><td>Stipulate a dependency on a MODULE_ID </td></tr>
<tr><td> WORKDIR <arg>              </td><td>Change directory during build </td></tr>
<tr><td> IF FILE_EXISTS <arg>       </td><td>Start an IF block that runs commands if the file specified exists </td></tr>
<tr><td> IF_NOT FILE_EXISTS <arg>   </td><td>Start an IF block that runs commands if the file specified does not exist </td></tr>
<tr><td> ELIF_NOT FILE_EXISTS <arg> </td><td>Start an ELSE block that runs commands if the file specified does not exist </td></tr>
<tr><td> ELIF FILE_EXISTS <arg>     </td><td>Start else ELSE block that runs commands if the file specified exists </td></tr>
<tr><td> ELSE                       </td><td>else block for an IF block </td></tr>
<tr><td> ENDIF                      </td><td>end the IF block </td></tr>
<tr><td> PAUSE_POINT <arg>          </td><td>Pause the build and give the user a shell to interact with. <arg> is the message the user sees eg 'Check all is ok' </td></tr>
<tr><td> LOGIN <arg>                </td><td>Log in as a user. Must be matched by a LOGOUT within the same section. <arg> is username </td></tr>
<tr><td> LOGOUT                     </td><td>Log out from a LOGIN </td></tr>
<tr><td> USER <arg>                 </td><td>Synonym for LOGIN </td></tr>
<tr><td> COMMENT <arg>              </td><td>Comment to pass through to the ShutIt script </td></tr>
<tr><td> DESCRIPTION <arg>          </td><td>A description of the module </td></tr>
</table>

# Docker delivery method

The following are only usable when 'DELIVERY docker' line is included,
and are as per the Dockerfile syntax. ShutIt-specific notes are made here.

<table>
<tr><td><b>Command</b></td><td><b>Description</b></td></tr>
<tr><td>FROM         </td><td></td></tr>
<tr><td>EXPOSE       </td><td></td></tr>
<tr><td>CMD          </td><td></td></tr>
<tr><td>ADD          </td><td></td></tr>
<tr><td>COPY         </td><td></td></tr>
<tr><td>VOLUME       </td><td></td></tr>
<tr><td>COMMIT <arg1></td><td>Commit the container at this point. <arg1> is the repository name, eg myrepo_name:mytag </td></tr>
<tr><td>PUSH   <arg1></td><td>Push the image with the tag <arg1> </td></tr>
</table>

# ShutIt Lifecycle specifiers

This is advanced, and optional functionality.

If not specified, then it is assumed we are in a 'build' section.

<table>
<tr><td><b>Command</b></td><td><b>Description</b></td></tr>
<tr><td>BUILD_BEGIN       </td><td> </td></tr>
<tr><td>BUILD_END         </td><td> </td></tr>
<tr><td>START_BEGIN       </td><td> </td></tr>
<tr><td>START_END         </td><td> </td></tr>
<tr><td>STOP_BEGIN        </td><td> </td></tr>
<tr><td>STOP_END          </td><td> </td></tr>
<tr><td>TEST_BEGIN        </td><td> </td></tr>
<tr><td>TEST_END          </td><td> </td></tr>
<tr><td>CONFIG_BEGIN      </td><td> </td></tr>
<tr><td>CONFIG_END        </td><td> </td></tr>
<tr><td>ISINSTALLED_BEGIN </td><td> </td></tr>
<tr><td>ISINSTALLED_END   </td><td> </td></tr>
</table>
