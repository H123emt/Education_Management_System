package com.example.educationsystem;

public class ExamData {
    private String q1;
    private String q2;
    private String q3;
    
    public String getq1(){
        return q1;
    }
    public void setq1(String q1){
        this.q1=q1;
    }
    public String getq2(){
        return q2;
    }
    public void setq2(String q2){
        this.q2=q2;
    }
    public String getq3(){
        return q3;
    }
    public void setq3(String q3){
        this.q3=q3;
    }
    @Override
    public String toString(){
        return "{\"q1\": "+q1+",\"q2\": "+q2+",\"q3\": "+q3+"}";

    }
public String[] getAnsArray(){
    String[] arr= {null,q1,q2,q3};
    return arr;
}


class Examdata {
    private String[] ansArray;

    public String[] getAnsArray() {
        return ansArray;
    }

    public void setAnsArray(String[] ansArray) {
        this.ansArray = ansArray;
    }

    @Override
    public String toString() {
        // Convert the answer array to a JSON-like string representation
        StringBuilder sb = new StringBuilder();
        sb.append("{");
        for (int i = 0; i < ansArray.length; i++) {
            sb.append("\"answer").append(i).append("\":\"").append(ansArray[i]).append("\"");
            if (i < ansArray.length - 1) {
                sb.append(",");
            }
        }
        sb.append("}");
        return sb.toString();
    }
    


}



}
