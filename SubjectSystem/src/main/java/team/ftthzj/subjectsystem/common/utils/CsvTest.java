package team.ftthzj.subjectsystem.common.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import team.ftthzj.subjectsystem.common.utils.CSVUtils;


/**
 * CSV操作(导出和导入)
 *
 * @author 林计钦
 * @version 1.0 Jan 27, 2014 4:17:02 PM
 */
public class CsvTest {

    /**
     * CSV导出
     *
     * @throws Exception
     */
    public static void main(String args[]) {
        List<String> dataList=new ArrayList<>();
        dataList.add("1,张三,男");
        dataList.add("2,李四,男");
        dataList.add("3,小红,女");
        boolean isSuccess=CSVUtils.exportCsv(new File("/Users/abao/Desktop/大三下/1.csv"), dataList);
        System.out.println(isSuccess);
    }

    /**
     * CSV导出
     *
     * @throws Exception
     */
    public void importCsv()  {
        List<String> dataList=CSVUtils.importCsv(new File("D:/test/ljq.csv"));
        if(dataList!=null && !dataList.isEmpty()){
            for(String data : dataList){
                System.out.println(data);
            }
        }
    }


}