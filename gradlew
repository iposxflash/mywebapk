#!/usr/bin/env sh
#
# Copyright 2007-2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses "$JAVA_HOME/jre/sh/java" as the system java executable
        JAVA_EXE="$JAVA_HOME/jre/sh/java"
    elif [ -x "$JAVA_HOME/bin/java" ] ; then
        JAVA_EXE="$JAVA_HOME/bin/java"
    else
        JAVA_EXE="java"
    fi
    if [ -z "$JAVA_HOME_SET" ] ; then
        JAVA_HOME_SET="true"
    fi
else
    JAVA_EXE="java"
fi

# Determine the directory for the distribution.
APP_DIR=`dirname "$0"`
APP_NAME=`basename "$0"`
APP_BASE_NAME=${APP_NAME%.*}

# Determine the path to the wrapper JAR.
# Note: $APP_DIR is the root of the project
WRAPPER_JAR="$APP_DIR/gradle/wrapper/gradle-wrapper.jar"

# Check if the wrapper JAR exists.
if [ ! -f "$WRAPPER_JAR" ] ; then
    echo "The wrapper JAR is missing. Did you forget to run 'gradlew wrapper'?"
    exit 1
fi

# Execute the wrapper.
exec "$JAVA_EXE" -jar "$WRAPPER_JAR" "$@"
