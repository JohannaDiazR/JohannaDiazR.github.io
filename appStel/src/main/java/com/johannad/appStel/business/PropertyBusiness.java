package com.johannad.appStel.business;

import com.johannad.appStel.dtos.PropertyDto;
import com.johannad.appStel.dtos.ResidentDto;
import com.johannad.appStel.dtos.WalletStatusDto;
import com.johannad.appStel.entity.Property;
import com.johannad.appStel.entity.Resident;
import com.johannad.appStel.entity.WalletStatus;
import com.johannad.appStel.service.PropertyService;
import com.johannad.appStel.service.ResidentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class PropertyBusiness {

    @Autowired
    private PropertyService propertyService;
    @Autowired
    private ResidentService residentService;
    private List<Property> propertyList;
    private List<PropertyDto> propertyDtoList = new ArrayList<>();

    public List<PropertyDto> findAll() throws Exception {
        this.propertyList = this.propertyService.findAll();
        this.propertyList.stream().forEach(property -> {
            PropertyDto propertyDto = new PropertyDto();
            propertyDto.setId(property.getId());

            Resident resident = property.getResident();
            if (resident != null){
                ResidentDto residentDto = new ResidentDto();
                residentDto.setId(resident.getId());
                residentDto.setNomResidente(resident.getNomResidente());
                residentDto.setCedResidente(resident.getCedResidente());
                residentDto.setEmaResidente(resident.getEmaResidente());
                residentDto.setCelResidente(resident.getCelResidente());
                residentDto.setNumIntegrantes(resident.getNumIntegrantes());
                propertyDto.setResident(residentDto);

            }

            propertyDto.setAndInmueble(property.getAndInmueble());
            propertyDto.setNumInmueble(property.getNumInmueble());
            propertyDtoList.add(propertyDto);
        });
        return this.propertyDtoList;
    }
    //POST
    public PropertyDto create(PropertyDto propertyDto) throws Exception {
        Property property = mapDtoToProperty(propertyDto);
        Property createdProperty = propertyService.create(property);
        return mapPropertyToDto(createdProperty);
    }
    //PUT
    public void update(PropertyDto propertyDto, int id) throws Exception {
        Property existingProperty = propertyService.findById(id);
        if (existingProperty == null) {
            throw new Exception("Property not found");
        }
        existingProperty.setAndInmueble(propertyDto.getAndInmueble());
        existingProperty.setNumInmueble(propertyDto.getNumInmueble());

        ResidentDto residentDto = propertyDto.getResident();
        if (residentDto != null) {
            Resident existingResident = existingProperty.getResident();
            if (existingResident == null){
                existingResident = new Resident();
            }
            existingResident.setId(residentDto.getId());
            existingResident.setNomResidente(residentDto.getNomResidente());
            existingResident.setCedResidente(residentDto.getCedResidente());
            existingResident.setEmaResidente(residentDto.getEmaResidente());
            existingResident.setCelResidente(residentDto.getCelResidente());
            existingResident.setNumIntegrantes(residentDto.getNumIntegrantes());

            existingProperty.setResident(existingResident);
        }
        propertyService.update(existingProperty);
    }
    private PropertyDto mapPropertyToDto(Property property) {
        PropertyDto propertyDto = new PropertyDto();
        propertyDto.setId(property.getId());

        ResidentDto residentDto = new ResidentDto();
        Resident resident = property.getResident();
        if (resident != null) {

            residentDto.setId(resident.getId());
            residentDto.setNomResidente(resident.getNomResidente());
            residentDto.setCedResidente(resident.getCedResidente());
            residentDto.setEmaResidente(resident.getEmaResidente());
            residentDto.setCelResidente(resident.getCelResidente());
            residentDto.setNumIntegrantes(resident.getNumIntegrantes());
            propertyDto.setResident(residentDto);
        }
        propertyDto.setAndInmueble(property.getAndInmueble());
        propertyDto.setNumInmueble(property.getNumInmueble());
        return propertyDto;
    }
    private Property mapDtoToProperty(PropertyDto propertyDto) {
        Property property = new Property();
        property.setAndInmueble(propertyDto.getAndInmueble());
        property.setNumInmueble(propertyDto.getNumInmueble());

        ResidentDto residentDto = propertyDto.getResident();
        if (residentDto != null){
            Resident resident = new Resident();
            resident.setId(residentDto.getId());
            resident.setNomResidente(residentDto.getNomResidente());
            resident.setCedResidente(residentDto.getCedResidente());
            resident.setEmaResidente(residentDto.getEmaResidente());
            resident.setCelResidente(residentDto.getCelResidente());
            resident.setNumIntegrantes(residentDto.getNumIntegrantes());
            property.setResident(resident);
        }
        return property;
    }
}

