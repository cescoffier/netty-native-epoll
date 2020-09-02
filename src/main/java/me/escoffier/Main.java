package me.escoffier;

import io.netty.channel.epoll.Epoll;

public class Main {

    public static void main(String[] args) {
        System.out.println(Epoll.isAvailable());
        Epoll.unavailabilityCause().printStackTrace();
    }
}
