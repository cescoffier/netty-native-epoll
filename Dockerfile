FROM registry.access.redhat.com/ubi8/ubi-minimal
WORKDIR /work/
COPY src/main/resources/META-INF/native/libnetty_transport_native_epoll.so /usr/lib64/netty_transport_native_epoll_x86_64.so
COPY target/netty-native-epoll /work/application
RUN chmod 775 /work
EXPOSE 8081
CMD ["./application"]