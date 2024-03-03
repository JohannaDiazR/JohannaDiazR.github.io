package com.johannad.appStel.dtos;

import com.johannad.appStel.entity.Resident;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PropertyDto {
    private int id;
    private int andInmueble;
    private int numInmueble;

    private ResidentDto resident;
}
