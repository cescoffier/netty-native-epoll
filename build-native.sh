#!/bin/sh
mvn clean package dependency:copy-dependencies
cp target/netty-native-epoll-1.0-SNAPSHOT.jar target/dependency
docker run \
    -v ${PWD}/target/dependency:/project:z \
    --env LANG=C \
    --rm quay.io/quarkus/ubi-quarkus-native-image:20.2.0-java11 \
    -J-Dsun.nio.ch.maxUpdateArraySize=100 \
    -J-Dio.netty.leakDetection.level=DISABLED \
    -J-Dio.netty.allocator.maxOrder=1 \
    -J-Duser.language=en \
    -J-Dfile.encoding=UTF-8 \
    --initialize-at-build-time= \
    -H:InitialCollectionPolicy=com.oracle.svm.core.genscavenge.CollectionPolicy\$BySpaceAndTime \
    -H:+JNI \
    -jar netty-native-epoll-1.0-SNAPSHOT.jar \
    -H:FallbackThreshold=0 \
    -H:+ReportExceptionStackTraces \
    -H:-AddAllCharsets \
    -H:EnableURLProtocols=http,https \
    --enable-all-security-services \
    --no-server \
    -H:-UseServiceLoaderFeature \
    -H:+StackTrace netty-native-epoll \
    -cp netty-transport-native-epoll-4.1.49.Final-linux-x86_64.jar:netty-native-epoll-1.0-SNAPSHOT.jar:netty-common-4.1.49.Final.jar:netty-transport-native-unix-common-4.1.49.Final.jar
cp target/dependency/netty-native-epoll target
