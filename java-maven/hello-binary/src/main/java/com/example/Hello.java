package com.example;

/**
 * Minimal Java executable for the M40 ``java-maven/hello-binary``
 * fixture. The pom.xml's ``maven-jar-plugin`` configuration sets the
 * jar's ``Main-Class`` manifest attribute to ``com.example.Hello`` so
 * the produced ``target/hello-1.0.jar`` runs via
 * ``java -jar target/hello-1.0.jar``.
 *
 * Imports nothing beyond ``java.lang`` (stdlib) so the build needs no
 * external Maven dependencies — keeping the M40 offline-mode contract
 * (``mvn package -o``) trivially satisfiable without a warm-step.
 */
public class Hello {
    public static void main(String[] args) {
        System.out.println("hello from java-maven-hello-binary");
    }
}
