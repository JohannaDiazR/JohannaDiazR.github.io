package com.johannad.appStel.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDocsDto {
    private int id;
    private String classDocsAdmin;
    private String petiDocsAdmin;

    private WorkerDto worker;
}
