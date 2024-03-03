package com.johannad.appStel.business;

import com.johannad.appStel.dtos.*;
import com.johannad.appStel.entity.*;
import com.johannad.appStel.service.RoleService;
import com.johannad.appStel.service.VisitorService;
import com.johannad.appStel.service.WalletStatusService;
import com.johannad.appStel.service.WorkerService;
import com.sun.jdi.PrimitiveValue;
import jakarta.persistence.metamodel.SingularAttribute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.AbstractPersistable;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Component

public class WorkerBusiness {

    @Autowired
    private WorkerService workerService;
    @Autowired
    private RoleService roleService;

    private List<Worker> workerList;
    private List<WorkerDto> workerDtoList = new ArrayList<>();

    public List<WorkerDto> findAll() throws Exception {
        this.workerList = this.workerService.findAll();
        this.workerList.stream().forEach(worker -> {
            WorkerDto workerDto = new WorkerDto();
            workerDto.setId(worker.getId());

            Role role = worker.getRole();
            if (role != null){
                RoleDto roleDto = new RoleDto();
                roleDto.setId(role.getId());
                roleDto.setNombreRol(role.getNombreRol());
                workerDto.setRole(roleDto);
            }
            workerDto.setNomTrabajador(worker.getNomTrabajador());
            workerDto.setCcTrabajador(worker.getCcTrabajador());
            workerDto.setCelTrabajador(worker.getCelTrabajador());
            workerDto.setEmaTrabajador(worker.getEmaTrabajador());
            workerDto.setTpcoTrabajador(worker.getTpcoTrabajador());
            workerDto.setConTrabajador(worker.getConTrabajador());
            workerDto.setCargTrabajador(worker.getCargTrabajador());
            workerDto.setEmpTrabajador(worker.getEmpTrabajador());
            workerDtoList.add(workerDto);
        });
        return this.workerDtoList;
    }
    //POST
    public WorkerDto create(WorkerDto workerDto) throws Exception {
        Worker worker = mapDtoToWorker(workerDto);
        Worker createdWorker = workerService.create(worker);
        return mapWorkerToDto(createdWorker);
    }

    //PUT
    public void update(WorkerDto workerDto, int id) throws Exception {
        Worker existingWorker = workerService.findById(id);
        if (existingWorker == null) {
            throw new Exception("Worker not found");
        }

        existingWorker.setNomTrabajador(workerDto.getNomTrabajador());
        existingWorker.setCcTrabajador(workerDto.getCcTrabajador());
        existingWorker.setCelTrabajador(workerDto.getCelTrabajador());
        existingWorker.setEmaTrabajador(workerDto.getEmaTrabajador());
        existingWorker.setTpcoTrabajador(workerDto.getTpcoTrabajador());
        existingWorker.setConTrabajador(workerDto.getConTrabajador());
        existingWorker.setCargTrabajador(workerDto.getCargTrabajador());
        existingWorker.setEmpTrabajador(workerDto.getEmpTrabajador());

        RoleDto roleDto = workerDto.getRole();
        if (roleDto != null) {
            Role existingRole = existingWorker.getRole();
            if (existingRole == null) {
                existingRole = new Role();
            }

            existingRole.setId(roleDto.getId());
            existingRole.setNombreRol(roleDto.getNombreRol());

            existingWorker.setRole(existingRole);

        }
        workerService.update(existingWorker);
    }
        private WorkerDto mapWorkerToDto(Worker worker) {
            WorkerDto workerDto = new WorkerDto();
            workerDto.setId(worker.getId());

            RoleDto roleDto = new RoleDto();
            Role role = worker.getRole();
            if (role != null) {

                roleDto.setId(role.getId());
                roleDto.setNombreRol(role.getNombreRol());
                workerDto.setRole(roleDto);
            }

            workerDto.setNomTrabajador(worker.getNomTrabajador());
            workerDto.setCcTrabajador(worker.getCcTrabajador());
            workerDto.setCelTrabajador(worker.getCelTrabajador());
            workerDto.setEmaTrabajador(worker.getEmaTrabajador());
            workerDto.setTpcoTrabajador(worker.getTpcoTrabajador());
            workerDto.setConTrabajador(worker.getConTrabajador());
            workerDto.setCargTrabajador(worker.getCargTrabajador());
            workerDto.setEmpTrabajador(worker.getEmpTrabajador());
            return workerDto;
        }

    private Worker mapDtoToWorker(WorkerDto workerDto) {
        Worker worker = new Worker();
        worker.setNomTrabajador(workerDto.getNomTrabajador());
        worker.setCcTrabajador(workerDto.getCcTrabajador());
        worker.setCelTrabajador(workerDto.getCelTrabajador());
        worker.setEmaTrabajador(workerDto.getEmaTrabajador());
        worker.setTpcoTrabajador(workerDto.getTpcoTrabajador());
        worker.setConTrabajador(workerDto.getConTrabajador());
        worker.setCargTrabajador(workerDto.getCargTrabajador());
        worker.setEmpTrabajador(workerDto.getEmpTrabajador());

        RoleDto roleDto = workerDto.getRole();
        if (roleDto != null) {
            Role role = new Role();
            role.setId(roleDto.getId());
            role.setNombreRol(roleDto.getNombreRol());
            worker.setRole(role);
        }

        return worker;
    }

}
