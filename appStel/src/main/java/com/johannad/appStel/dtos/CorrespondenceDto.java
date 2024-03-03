package com.johannad.appStel.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CorrespondenceDto {
    private int id;
    private String tipoCorrespondencia;
    private Date frecCorrespondencia;
    private String estCorrespondencia;
    private Date fentrCorrespondencia;

    private WorkerDto worker;
}
