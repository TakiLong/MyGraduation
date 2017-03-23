package com.imut.journal.filter;

import java.security.Principal;

/**
 * @author suojingjing
 */
public class AuthorPricinple implements Principal {
    private String name;

    public AuthorPricinple(String name) {
        this.name = name;
    }

    @Override
    public String getName() {
        return this.name;
    }
}
