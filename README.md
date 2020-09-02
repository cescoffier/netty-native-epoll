# Netty / EPoll (Native Transport) / GraalVM reproducer


```bash
./build-native.sh && ./build-docker.sh  && ./docker-run.sh
```

The previous command checks if the Epoll can be enabled and print the cause.

At the moment is fails with:

```bash
java.lang.UnsatisfiedLinkError: unsupported JNI version 0xFFFFFFFF required by /tmp/libnetty_transport_native_epoll_x86_641612830649962053805.so
	Suppressed: java.lang.UnsatisfiedLinkError: unsupported JNI version 0xFFFFFFFF required by /tmp/libnetty_transport_native_epoll_x86_641612830649962053805.so
	Suppressed: java.lang.UnsatisfiedLinkError: no netty_transport_native_epoll_x86_64 in java.library.path: [/usr/java/packages/lib, /usr/lib64, /lib64, /lib, /usr/lib]
		Suppressed: java.lang.UnsatisfiedLinkError: no netty_transport_native_epoll_x86_64 in java.library.path: [/usr/java/packages/lib, /usr/lib64, /lib64, /lib, /usr/lib]
	Suppressed: java.lang.UnsatisfiedLinkError: unsupported JNI version 0xFFFFFFFF required by /tmp/libnetty_transport_native_epoll4845857273047313653.so
		Suppressed: java.lang.UnsatisfiedLinkError: unsupported JNI version 0xFFFFFFFF required by /tmp/libnetty_transport_native_epoll4845857273047313653.so
		Suppressed: java.lang.UnsatisfiedLinkError: no netty_transport_native_epoll in java.library.path: [/usr/java/packages/lib, /usr/lib64, /lib64, /lib, /usr/lib]
			Suppressed: java.lang.UnsatisfiedLinkError: no netty_transport_native_epoll in java.library.path: [/usr/java/packages/lib, /usr/lib64, /lib64, /lib, /usr/lib]
```
