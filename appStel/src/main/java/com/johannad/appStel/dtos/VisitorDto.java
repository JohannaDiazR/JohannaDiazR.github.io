package com.johannad.appStel.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitorDto {
    private int id;
    private String nomVisitante;
    private int cedVisitante;
    private String nomResidente;
    private boolean carVisitante;
    private boolean ingrVisitante;
    private Date fecVisitante;

    private WorkerDto worker;
    private PropertyDto property;
    private ParkingDto parking;
}
