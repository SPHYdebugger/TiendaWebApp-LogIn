package com.svalero.Domain;

import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Client {

    private int id_client;
    @NonNull
    private String firstName;
    @NonNull
    private String lastName;
    @NonNull
    private String dni;
    @NonNull
    private String address;
    @NonNull
    private String city;
    @NonNull
    private String email;
    @NonNull
    private String password;
    @NonNull
    private int telephone;
    @NonNull
    private String image;



}

