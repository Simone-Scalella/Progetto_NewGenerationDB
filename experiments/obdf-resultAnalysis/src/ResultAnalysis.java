import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import java.util.Arrays;



public class ResultAnalysis {

    static Set<QueryResult> getAllQueryResult(String file){
        Set<QueryResult> results = new HashSet<QueryResult>();
        Map<String, QueryResult> runResult = new HashMap<String, QueryResult>();
        try{
            FileInputStream fis = new FileInputStream(file);
            InputStreamReader fr = new InputStreamReader(fis);
            BufferedReader br = new BufferedReader(fr);
            String line=new String();
            while ((line = br.readLine())!=null){
                if(line.contains("num_results")){
                    String[] s = line.split(" ");
                    String run_num = s[0].substring(s[0].indexOf("#")+1, s[0].indexOf("]"));
                    int q_id = Integer.parseInt(s[1].substring(s[1].indexOf("#")+1, s[1].indexOf(".")));
                    int ans_num = Integer.parseInt(s[3]);
                    if(runResult.containsKey(run_num)){
                        runResult.get(run_num).ans_num[q_id] = ans_num;
                    }
                    else{
                        QueryResult qr = new QueryResult();
                        qr.run_num = run_num;
                        qr.ans_num[q_id] = ans_num;
                        runResult.put(run_num, qr);
                    }
                }
                else if(line.contains("execution_time")){
                    String[] s = line.split(" ");
                    String run_num = s[0].substring(s[0].indexOf("#")+1, s[0].indexOf("]"));
                    int q_id = Integer.parseInt(s[1].substring(s[1].indexOf("#")+1, s[1].indexOf(".")));
                    int exe_time = Integer.parseInt(s[3]);
                    if(runResult.containsKey(run_num)){
                        runResult.get(run_num).execute_time[q_id] = exe_time;
                    }
                    else{
                        QueryResult qr = new QueryResult();
                        qr.run_num = run_num;
                        qr.execute_time[q_id] = exe_time;
                        runResult.put(run_num, qr);
                    }
                }
            }
            results.addAll(runResult.values());

            fr.close();
            br.close();

            }catch(Exception e){
            e.printStackTrace();
        }
        return results;
    }

    static double[] getAvgExeTime(String file){
        double[] sumTime = new double[13];
        double[] avgTime = new double[13];
        Set<QueryResult> QR = getAllQueryResult(file);
        for(QueryResult qr: QR){
            for(int i=0; i<qr.execute_time.length; i++){
                sumTime[i]=sumTime[i]+qr.execute_time[i];
            }
        }

        for(int i=0; i<sumTime.length; i++){
            avgTime[i]=sumTime[i]/QR.size();
        }

        return avgTime;
    }


    public static void main(String[] args){
        ResultAnalysis RA = new ResultAnalysis();
        Set<QueryResult> QR = RA.getAllQueryResult("./obda-mixer/results/200000/mixer-stats-hom-opt-matv.txt");
        for(QueryResult qr: QR){
            System.out.println(Arrays.toString(qr.execute_time ));
        }
        System.out.println(Arrays.toString( RA.getAvgExeTime("./obda-mixer/results/200000/mixer-stats-hom-opt-matv.txt")));
    }

}


class QueryResult {
    public String run_num;
    public int[] execute_time;
    public int[] ans_num;
    /**
     * execute_time: execute_times of queries 00.sql, 01.sql, ..., 12.sql
     * ans_num: numbers of answers of queries 00.sql, 01.sql, ..., 12.sql
     */
    public QueryResult(){
        run_num="";
        execute_time = new int[13];
        ans_num = new int[13];
    }
}