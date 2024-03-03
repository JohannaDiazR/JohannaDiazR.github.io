package com.johannad.appStel.business;

import com.johannad.appStel.dtos.AdminDocsDto;
import com.johannad.appStel.dtos.WorkerDto;
import com.johannad.appStel.entity.AdminDocs;
import com.johannad.appStel.entity.Worker;
import com.johannad.appStel.service.AdminDocsService;
import com.johannad.appStel.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AdminDocsBusiness {

    @Autowired
    private AdminDocsService adminDocsService;

    @Autowired
    private WorkerService workerService;

    private List<AdminDocs> adminDocsList;
    private List<AdminDocsDto> adminDocsDtoList = new ArrayList<>();

    public List<AdminDocsDto> findAll() throws Exception {
        this.adminDocsList = this.adminDocsService.findAll();
        this.adminDocsList.stream().forEach(adminDocs -> {
            AdminDocsDto adminDocsDto = new AdminDocsDto();
            adminDocsDto.setId(adminDocs.getId());

            Worker worker = adminDocs.getWorker();
            if (worker != null) {
                WorkerDto workerDto = new WorkerDto();
                workerDto.setId(worker.getId());
                workerDto.setNomTrabajador(worker.getNomTrabajador());
                workerDto.setCcTrabajador(worker.getCcTrabajador());
                workerDto.setCelTrabajador(worker.getCelTrabajador());
                workerDto.setEmaTrabajador(worker.getEmaTrabajador());
                workerDto.setTpcoTrabajador(worker.getTpcoTrabajador());
                workerDto.setConTrabajador(worker.getConTrabajador());
                workerDto.setCargTrabajador(worker.getCargTrabajador());
                workerDto.setEmpTrabajador(worker.getEmpTrabajador());
                adminDocsDto.setWorker(workerDto);
            }
            adminDocsDto.setClassDocsAdmin(adminDocs.getClassDocsAdmin());
            adminDocsDto.setPetiDocsAdmin(adminDocs.getPetiDocsAdmin());
            adminDocsDtoList.add(adminDocsDto);

        });
        return this.adminDocsDtoList;
    }

    //POST
    public AdminDocsDto create(AdminDocsDto adminDocsDto) throws Exception {
        AdminDocs adminDocs = mapDtoToAdminDocs(adminDocsDto);
        AdminDocs createdAdminDocs = adminDocsService.create(adminDocs);
        return mapAdminDocsToDto(createdAdminDocs);
    }
    //put
    public void update(AdminDocsDto adminDocsDto, int id) throws Exception {
        AdminDocs existingAdminDocs = adminDocsService.findById(id);
        if (existingAdminDocs == null) {
            throw new Exception("AdminDocs not found");
        }

        existingAdminDocs.setClassDocsAdmin(adminDocsDto.getClassDocsAdmin());
        existingAdminDocs.setPetiDocsAdmin(adminDocsDto.getPetiDocsAdmin());

        WorkerDto workerDto = adminDocsDto.getWorker();
        if (workerDto != null) {
            Worker existingWorker = existingAdminDocs.getWorker();
            if (existingWorker == null) {
                existingWorker = new Worker();
            }

            existingWorker.setId(workerDto.getId());
            existingWorker.setNomTrabajador(workerDto.getNomTrabajador());
            existingWorker.setCcTrabajador(workerDto.getCcTrabajador());
            existingWorker.setCelTrabajador(workerDto.getCelTrabajador());
            existingWorker.setEmaTrabajador(workerDto.getEmaTrabajador());
            existingWorker.setTpcoTrabajador(workerDto.getTpcoTrabajador());
            existingWorker.setConTrabajador(workerDto.getConTrabajador());
            existingWorker.setCargTrabajador(workerDto.getCargTrabajador());
            existingWorker.setEmpTrabajador(workerDto.getEmpTrabajador());

            existingAdminDocs.setWorker(existingWorker);
        }

        adminDocsService.update(existingAdminDocs);
    }

    private AdminDocsDto mapAdminDocsToDto(AdminDocs adminDocs) {
        AdminDocsDto adminDocsDto = new AdminDocsDto();
        adminDocsDto.setId(adminDocs.getId());

        WorkerDto workerDto = new WorkerDto();
        Worker worker = adminDocs.getWorker();
        if (worker != null) {
            workerDto.setId(worker.getId());

            workerDto.setNomTrabajador(worker.getNomTrabajador());
            workerDto.setCcTrabajador(worker.getCcTrabajador());
            workerDto.setEmaTrabajador(worker.getEmaTrabajador());
            workerDto.setCelTrabajador(worker.getCelTrabajador());
            workerDto.setTpcoTrabajador(worker.getTpcoTrabajador());
            workerDto.setConTrabajador(worker.getConTrabajador());
            workerDto.setCargTrabajador(worker.getCargTrabajador());
            workerDto.setEmpTrabajador(worker.getEmpTrabajador());

            adminDocsDto.setWorker(workerDto);
        }

        adminDocsDto.setClassDocsAdmin(adminDocs.getClassDocsAdmin());
        adminDocsDto.setPetiDocsAdmin(adminDocs.getPetiDocsAdmin());
        return adminDocsDto;
    }

    private AdminDocs mapDtoToAdminDocs(AdminDocsDto adminDocsDto) {
        AdminDocs adminDocs = new AdminDocs();
        adminDocs.setClassDocsAdmin(adminDocsDto.getClassDocsAdmin());
        adminDocs.setPetiDocsAdmin(adminDocsDto.getPetiDocsAdmin());

        WorkerDto workerDto = adminDocsDto.getWorker();
        if (workerDto != null) {
            Worker worker = new Worker();
            worker.setId(workerDto.getId());

            worker.setNomTrabajador(workerDto.getNomTrabajador());
            worker.setCcTrabajador(workerDto.getCcTrabajador());
            worker.setCelTrabajador(workerDto.getCelTrabajador());
            worker.setEmaTrabajador(workerDto.getEmaTrabajador());
            worker.setTpcoTrabajador(workerDto.getTpcoTrabajador());
            worker.setConTrabajador(workerDto.getConTrabajador());
            worker.setCargTrabajador(workerDto.getCargTrabajador());
            worker.setEmpTrabajador(workerDto.getEmpTrabajador());

            adminDocs.setWorker(worker);
        }

        return adminDocs;
    }
}
