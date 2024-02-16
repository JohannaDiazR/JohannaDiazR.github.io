package com.johannad.appStel.service.imp;

import com.johannad.appStel.entity.AdminDocs;
import com.johannad.appStel.repository.AdminDocsRepository;
import com.johannad.appStel.service.AdminDocsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminDocsImp implements AdminDocsService {
    @Autowired
    private AdminDocsRepository adminDocsRepository;

    private List<AdminDocs> admindocsList;

    @Override
    public List<AdminDocs> findAll()throws Exception{
        this.admindocsList=this.adminDocsRepository.findAll();
        return this.admindocsList;

    }

    @Override
    public AdminDocs findById(int id){
        AdminDocs admindocs=this.adminDocsRepository.findById(id);
        return admindocs;
    }

    @Override
    public void create(AdminDocs admindocs){
        this.adminDocsRepository.save(admindocs);
    }

    @Override
    public void update(AdminDocs admindocs){
        this.adminDocsRepository.save(admindocs);
    }

    @Override
    public void delete(AdminDocs admindocs){
        this.adminDocsRepository.delete(admindocs);
    }

}
