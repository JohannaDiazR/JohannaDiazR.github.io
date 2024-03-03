package com.johannad.appStel.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WalletStatusDto {
    private int id;
    private String docestcartera;
    private String estcartera;
    private String taccestcartera;
    private String notiestcartera;

    private PropertyDto property;
    private WorkerDto worker;

}
