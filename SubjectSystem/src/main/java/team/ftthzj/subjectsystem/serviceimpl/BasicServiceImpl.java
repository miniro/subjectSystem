package team.ftthzj.subjectsystem.serviceimpl;

import team.ftthzj.subjectsystem.service.BasicService;

import java.util.ArrayList;
import java.util.List;

public class BasicServiceImpl implements BasicService {
    @Override
    public List<String> getTypeDicts(Integer typeId) {
        List<String> result = new ArrayList<>();
        if(typeId == 1){
            result.add("必修课");
            result.add("选修课");
        }
        else if (typeId == 2){
            result.add("1.0");
            result.add("1.5");
            result.add("2.0");
            result.add("2.5");
            result.add("3.0");
            result.add("3.5");
            result.add("4.0");
            result.add("4.5");
            result.add("5.0");
        }
        return result;
    }
}
