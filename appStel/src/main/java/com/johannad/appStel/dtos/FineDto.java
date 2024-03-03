package com.johannad.appStel.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FineDto {
    private int id;
    private String tipoMulta;
    private Date fecMulta;
    private String evidMulta;
    private int valMulta;
    private Date fpagMulta;

    private PropertyDto property;

    private WorkerDto worker;
}
