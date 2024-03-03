package com.johannad.appStel.business;

import com.johannad.appStel.dtos.ParkingDto;
import com.johannad.appStel.dtos.ResidentDto;
import com.johannad.appStel.dtos.RoleDto;
import com.johannad.appStel.entity.Parking;
import com.johannad.appStel.entity.Resident;
import com.johannad.appStel.entity.Role;
import com.johannad.appStel.service.ParkingService;
import com.johannad.appStel.service.ResidentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ResidentBusiness {
@Autowired
    private ResidentService residentService;
@Autowired
    private  ResidentService roleService;
@Autowired
    private ParkingService parkingService;
    private List<Resident> residentList;
    private List<ResidentDto> residentDtoList = new ArrayList<>();

    public List<ResidentDto> findAll() throws Exception {
        this.residentList=this.residentService.findAll();
        this.residentList.stream().forEach(resident -> {
            ResidentDto residentDto=new ResidentDto();
            residentDto.setId(resident.getId());

            Role role = resident.getRole();
            if (role != null){
                RoleDto roleDto = new RoleDto();
                roleDto.setId(role.getId());
                roleDto.setNombreRol(role.getNombreRol());
                residentDto.setRole(roleDto);
            }
            Parking parking = resident.getParking();
            if (parking != null){
                ParkingDto parkingDto = new ParkingDto();
                parkingDto.setId(parking.getId());
                parkingDto.setTipoParqueadero(parking.getTipoParqueadero());
                parkingDto.setEstadoParqueadero(parking.getEstadoParqueadero());
                parkingDto.setFecParqueadero(parking.getFecParqueadero());
                parkingDto.setDvteParqueadero(parking.getDvteParqueadero());
                parkingDto.setCupParqueadero(parking.getCupParqueadero());
                parkingDto.setHoraSalida(parking.getHoraSalida());
                parkingDto.setTarParqueadero(parking.getTarParqueadero());
                residentDto.setParking(parkingDto);
            }

            residentDto.setNomResidente(resident.getNomResidente());
            residentDto.setCedResidente(resident.getCedResidente());
            residentDto.setEmaResidente(resident.getEmaResidente());
            residentDto.setCelResidente(resident.getCelResidente());
            residentDto.setNumIntegrantes(resident.getNumIntegrantes());
            this.residentDtoList.add(residentDto);
        });
        return this.residentDtoList;
    }
    //POST
    public ResidentDto create(ResidentDto residentDto) throws Exception {
        Resident resident = mapDtoToResident(residentDto);
        Resident createdResident = residentService.create(resident);
        return mapResidentToDto(createdResident);

    }
    //PUT
    public void update(ResidentDto residentDto, int id) throws Exception {
        Resident existingResident = residentService.findById(id);
        if (existingResident == null){
            throw new Exception("Resident not found");
        }
        existingResident.setNomResidente(residentDto.getNomResidente());
        existingResident.setCedResidente(residentDto.getCedResidente());
        existingResident.setEmaResidente(residentDto.getEmaResidente());
        existingResident.setCelResidente(residentDto.getCelResidente());
        existingResident.setNumIntegrantes(residentDto.getNumIntegrantes());

        RoleDto roleDto = residentDto.getRole();
        if (roleDto != null){
            Role existingRole = existingResident.getRole();
            if (existingRole == null) {
                existingRole = new Role();
            }

            existingRole.setId(roleDto.getId());
            existingRole.setNombreRol(roleDto.getNombreRol());
            existingResident.setRole(existingRole);
        }

        ParkingDto parkingDto = residentDto.getParking();
        if (parkingDto != null){
            Parking existingParking = existingResident.getParking();
            if (existingParking == null){
                existingParking = new Parking();
            }

            existingParking.setId(parkingDto.getId());
            existingParking.setTipoParqueadero(parkingDto.getTipoParqueadero());
            existingParking.setEstadoParqueadero(parkingDto.getEstadoParqueadero());
            existingParking.setFecParqueadero(parkingDto.getFecParqueadero());
            existingParking.setDvteParqueadero(parkingDto.getDvteParqueadero());
            existingParking.setCupParqueadero(parkingDto.getCupParqueadero());
            existingParking.setHoraSalida(parkingDto.getHoraSalida());
            existingParking.setTarParqueadero(parkingDto.getTarParqueadero());
            existingResident.setParking(existingParking);

        }
        residentService.update(existingResident);
    }

    private ResidentDto mapResidentToDto(Resident resident) {
        ResidentDto residentDto = new ResidentDto();
        residentDto.setId(resident.getId());

        RoleDto roleDto = new RoleDto();
        Role role = resident.getRole();
        if (role != null) {
            roleDto.setId(role.getId());

            roleDto.setNombreRol(role.getNombreRol());
            residentDto.setRole(roleDto);
        }

        ParkingDto parkingDto = new ParkingDto();
        Parking parking = resident.getParking();
        if (parking != null) {
            parkingDto.setId(parking.getId());
            parkingDto.setTipoParqueadero(parking.getTipoParqueadero());
            parkingDto.setEstadoParqueadero(parking.getEstadoParqueadero());
            parkingDto.setFecParqueadero(parking.getFecParqueadero());
            parkingDto.setDvteParqueadero(parking.getDvteParqueadero());
            parkingDto.setCupParqueadero(parking.getCupParqueadero());
            parkingDto.setHoraSalida(parking.getHoraSalida());
            parkingDto.setTarParqueadero(parking.getTarParqueadero());
            residentDto.setParking(parkingDto);
        }
        residentDto.setNomResidente(resident.getNomResidente());
        residentDto.setCedResidente(resident.getCedResidente());
        residentDto.setEmaResidente(resident.getEmaResidente());
        residentDto.setCelResidente(resident.getCelResidente());
        residentDto.setNumIntegrantes(resident.getNumIntegrantes());
        return residentDto;
    }

    private Resident mapDtoToResident(ResidentDto residentDto){
        Resident resident = new Resident();
        resident.setNomResidente(residentDto.getNomResidente());
        resident.setCedResidente(residentDto.getCedResidente());
        resident.setEmaResidente(residentDto.getEmaResidente());
        resident.setCelResidente(residentDto.getCelResidente());
        resident.setNumIntegrantes(residentDto.getNumIntegrantes());

        RoleDto roleDto = residentDto.getRole();
        if (roleDto != null) {
            Role role = new Role();
            role.setId(roleDto.getId());
            role.setNombreRol(roleDto.getNombreRol());
            resident.setRole(role);
        }

        ParkingDto parkingDto = residentDto.getParking();
        if (parkingDto != null){
            Parking parking = new Parking();
            parking.setId(parkingDto.getId());
            parking.setTipoParqueadero(parkingDto.getTipoParqueadero());
            parking.setEstadoParqueadero(parkingDto.getEstadoParqueadero());
            parking.setFecParqueadero(parkingDto.getFecParqueadero());
            parking.setDvteParqueadero(parkingDto.getDvteParqueadero());
            parking.setCupParqueadero(parkingDto.getCupParqueadero());
            parking.setHoraSalida(parkingDto.getHoraSalida());
            parking.setTarParqueadero(parkingDto.getTarParqueadero());
            resident.setParking(parking);
        }
        return resident;


    }


}
