package com.svalero.Domain;

import lombok.*;

import java.time.LocalDate;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Buy {

    private int id_buy;
    private Client client;
    private Product product;
    @NonNull
    private LocalDate buyDate;




}
