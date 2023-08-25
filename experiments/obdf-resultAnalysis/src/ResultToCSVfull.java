
import java.io.*;
import java.util.*;


/********************
 * display results format1:
 *         sc1, sc2, hom, het, hom-opt, hom-opt-matv, het-opt, het-opt-matv
 *  00.sql ...
 *  01.sql ...
 *  03.sql ...
 *  ..........
 */

public class ResultToCSVfull {

    static double[][] getArrayFormat1(String folderPath){
        List<String> files = getFilePaths(folderPath);

        double[][] allAvgTimes = new double[13][8];
        for(String f: files){

            if(!f.endsWith(".txt")){
                continue;
            }

            double[] avgTimes = ResultAnalysis.getAvgExeTime(f);

            if(f.endsWith("mixer-stats-sc1.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][0] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-sc2.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][1] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-hom.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][2] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-het.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][3] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-hom-opt.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][4] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-hom-opt-matv.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][5] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-het-opt.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][6] = avgTimes[i];
                }
            }
            else if(f.endsWith("mixer-stats-het-opt-matv.txt")){
                for(int i=0; i<avgTimes.length; i++){
                    allAvgTimes[i][7] = avgTimes[i];
                }
            }
        }
        return allAvgTimes;
    }

    static void format1ToCSV(String folderPath, String outPutCSV){
        try{
            File file = new File(outPutCSV);

            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);

            double[][] results = getArrayFormat1(folderPath);
            bw.write("query"); bw.write(",");
            bw.write("sc1"); bw.write(",");
            bw.write("sc2"); bw.write(",");
            bw.write("hom"); bw.write(",");
            bw.write("het"); bw.write(",");
            bw.write("hom-opt"); bw.write(",");
            bw.write("hom-opt-matv"); bw.write(",");
            bw.write("het-opt"); bw.write(",");
            bw.write("het-opt-matv"); bw.write(",");
            bw.write("\r");

            for(int i=0; i<13; i++){
                bw.write(i+"th");
                bw.write(",");
                for(int j=0; j<8; j++){
                   bw.write(Double.toString(results[i][j]));
                   bw.write(",");
                }
                bw.write("\r");
            }

            bw.close();
            fw.close();

        }catch (Exception e){
            e.printStackTrace();
        }
    }


    static List<String> getFilePaths (String folderPath){
        List<String> filePath = new ArrayList<String>();

        File file = new File(folderPath);
        if(file.isDirectory()){
            File[] files = file.listFiles();
            for(int i=0; i<files.length; i++){
                filePath.add(folderPath+files[i].getName());
            }
        }

        return filePath;
    }


    public static void main(String[] args){

        ResultToCSVfull RTA = new ResultToCSVfull();
        String[] data = {"20000", "200000", "2000000"};

        for (String i : data) {
            RTA.format1ToCSV("./obda-mixer/results/"+i+"/","./obdf-resultAnalysis/resultFiles/"+i+".csv");
        }
        

//        double[][] arr = RTA.getArrayFormat1("./obda-mixer/results/20000/");
//        for(int i=0; i< arr.length; i++){
//            System.out.println(Arrays.toString(arr[i]));
//        }


    }
}
