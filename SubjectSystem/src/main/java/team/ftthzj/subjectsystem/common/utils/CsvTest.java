package team.ftthzj.subjectsystem.common.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import team.ftthzj.subjectsystem.common.utils.CSVUtils;

public class CsvTest {

    /**
     * CSV导出
     *
     * @throws Exception
     */
    public static void main(String args[]) {
//        List<String> dataList=new ArrayList<>();
//        dataList.add("1,张三,男");
//        dataList.add("2,李四,男");
//        dataList.add("3,小红,女");
//        boolean isSuccess=CSVUtils.exportCsv(new File("/Users/abao/Desktop/大三下/1.csv"), dataList);
//        System.out.println(isSuccess);

//        List<String> dataList=CSVUtils.importCsv(new File("/Users/abao/Desktop/大三下/import.csv"));
//        if(dataList!=null && !dataList.isEmpty()){
//            for(String data : dataList){
//                System.out.println(data);
//            }
//        }
        String file="C:\\fakepath\\abao.docx";
        String filePath=System.getProperty("user.dir")+"/import/"+file.split("\\\\")[2];
        System.out.println(filePath);
    }

    /**
     * CSV导出
     *
     * @throws Exception
     */
    public void importCsv()  {

    }


}