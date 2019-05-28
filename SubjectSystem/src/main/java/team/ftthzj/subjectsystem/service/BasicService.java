package team.ftthzj.subjectsystem.service;

import java.util.List;

public interface BasicService {

    //根据代号查询字典
    public List<String> getTypeDicts(Integer typeId);
}
