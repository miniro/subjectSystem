package team.ftthzj.subjectsystem.service;

import java.util.Set;

public interface BasicService {

    //根据代号查询字典
    public Set<String> getTypeDicts(int typeId);
}
