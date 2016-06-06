# ShutItFile Cheat Sheet

DELIVERY <arg>             - ShutIt delivery type (bash, docker)
MODULE_ID <arg>            - A unique identifying string for this module, eg
                             com.mycorp.myproject.mymodule
MAINTAINER <arg>           - Maintainer of the ShutIt module that is created
INSTALL <arg>              - Install a package. Figures out local package
                             manager
REMOVE <arg>               - Remove a package. Figures out local package
                             manager
SEND <arg>                 - String to input at terminal
RUN <arg>                  - See SEND
EXPECT <arg>               - Continue if the specified regexp is seen in the
                             output
EXPECT_MULTI <arg>         - 
ASSERT_OUTPUT <arg>        - If the output from the previous command does not
                             match, then throw an error
UNTIL <arg>                - Send the previous command until the specified
                             regexp is seen in the output
GET_PASSWORD <arg>         - Get a password from the user where appropriate.
                             Only allowed after a LOGIN or USER line. <arg> is
                             the prompt the user sees eg 'Input the password'
ENV <name>=<value>         - Exports a variable in the local build context
DEPENDS <arg>              - Stipulate a dependency on a MODULE_ID
WORKDIR <arg>              - Change directory during build
IF FILE_EXISTS <arg>       - Start an IF block that runs commands if the file
                             specified exists
IF_NOT FILE_EXISTS <arg>   - Start an IF block that runs commands if the file
                             specified does not exist
ELIF_NOT FILE_EXISTS <arg> - Start an ELSE block that runs commands if the
                             file specified does not exist
ELIF FILE_EXISTS <arg>     - Start else ELSE block that runs commands if the
                             file specified exists
ELSE                       - else block for an IF block
ENDIF                      - end the IF block
PAUSE_POINT <arg>          - Pause the build and give the user a shell to
                             interact with. <arg> is the message the user sees
                             eg 'Check all is ok'
LOGIN <arg>                - Log in as a user. Must be matched by a LOGOUT
                             within the same section. <arg> is username
LOGOUT                     - Log out from a LOGIN
USER <arg>                 - Synonym for LOGIN
COMMENT <arg>              - Comment to pass through to the ShutIt script

# Docker delivery method

The following are only usable when 'DELIVERY docker' line is included,
and are as per the Dockerfile syntax. ShutIt-specific notes are made here.

FROM
EXPOSE
ENTRYPOINT
CMD
ADD
COPY
VOLUME

# ShutIt Lifecycle specifiers

This is advanced, and optional functionality.

If not specified, then it is assumed we are in a 'build' section.

BUILD_BEGIN
BUILD_END
START_BEGIN
START_END
STOP_BEGIN
STOP_END
TEST_BEGIN
TEST_END
CONFIG_BEGIN
CONFIG_END
ISINSTALLED_BEGIN
ISINSTALLED_END
