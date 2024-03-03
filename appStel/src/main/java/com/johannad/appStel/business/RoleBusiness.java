package com.johannad.appStel.business;

import com.johannad.appStel.dtos.RoleDto;
import com.johannad.appStel.dtos.UserDto;
import com.johannad.appStel.entity.Role;
import com.johannad.appStel.entity.User;
import com.johannad.appStel.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RoleBusiness {
@Autowired
    private RoleService roleService;
    private List<Role> roleList;

    private List<RoleDto> roleDtoList = new ArrayList<>();

    public List<RoleDto> findAll() throws Exception {
        this.roleList=this.roleService.findAll();
        this.roleList.stream().forEach(role -> {
            RoleDto roleDto=new RoleDto();
            roleDto.setId(role.getId());
            roleDto.setNombreRol(role.getNombreRol());
            roleDtoList.add(roleDto);
        });
        return this.roleDtoList;
    }

        /*
        La clase rol solo tiene 4 roles
        1. Residente
        2. Administrador
        3. Vigilante
        4. Todero
         */

    //POST
    public RoleDto create(RoleDto roleDto) throws Exception {
        Role role = mapDtoToRole(roleDto);
        Role createdRole = roleService.create(role);
        return mapRoleToDto(createdRole);
    }

    //PUT
    public void update(RoleDto roleDto, int id) throws Exception {
        Role existingRole = roleService.findById(id);
        if (existingRole == null) {
            throw new Exception("Role not found");
        }
        existingRole.setNombreRol(roleDto.getNombreRol());

        roleService.update(existingRole);
    }
    private RoleDto mapRoleToDto(Role role){
        RoleDto roleDto = new RoleDto();
        roleDto.setId(role.getId());
        roleDto.setNombreRol(role.getNombreRol());
        return roleDto;
    }
    private Role mapDtoToRole (RoleDto roleDto){
        Role role = new Role();
        role.setNombreRol(roleDto.getNombreRol());
        return role;
    }


}
