package com.svalero.Domain;

import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class User {

    private int id_user;
    @NonNull
    private String user_name;
    @NonNull
    private String user_password;

    private String ident;



}

