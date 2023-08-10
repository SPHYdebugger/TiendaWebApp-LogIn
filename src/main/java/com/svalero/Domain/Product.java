package com.svalero.Domain;

import lombok.*;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter
public class Product {

    private int id_product;
    @NonNull
    private String name_p;
    @NonNull
    private String description_p;
    @NonNull
    private int format_p;
    @NonNull
    private float price;
    @NonNull
    String image;



}
