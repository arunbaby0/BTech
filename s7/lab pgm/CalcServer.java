import java.io.*;
import java.net.*;
public class CalcServer {
    public CalcServer(){
        try {
            ServerSocket s = new ServerSocket(7000);          
            while(true){
                System.out.print("waiting..");
                Socket c=s.accept();
                Process p=new Process(c);
                p.start();
            }            
            } catch (Exception ex) {}        
    } 
    public static void main(String args[]){
            new CalcServer();
    }
}
class Process extends Thread{
    BufferedReader b;
    PrintWriter p;
    String s;
    public Process(Socket c){
        System.out.print("Thread object");

        try {
            b=new BufferedReader(new InputStreamReader(c.getInputStream()));
            p = new PrintWriter(c.getOutputStream(), true);
        } catch (Exception ex) {
          }
    }  
    public void run(){
        try {
            while(true){
                s = b.readLine();
                int ans=calculate(s);
                System.out.print("\n");
                System.out.print(ans);
                System.out.print("\n");
                p.println(ans);
            }
        } catch (Exception ex) {
            Thread.currentThread().stop();
          }
    }
    public int calculate(String ss){
        String opnd1="",opnd2="";
        char optr = 0;
        int num1,num2;
        for(int i=0;i<ss.length();i++){
            if((ss.charAt(i)!='+')&&(ss.charAt(i)!='-')&&(ss.charAt(i)!='*')&&(ss.charAt(i)!='/')){
                opnd1=opnd1+ss.charAt(i);
            }
            else{
                optr=ss.charAt(i);
                for(int j=i+1;j<ss.length();j++){
                    opnd2=opnd2+ss.charAt(j);
                }
                break;
            }
        }
        num1=Integer.parseInt(opnd1);
        num2=Integer.parseInt(opnd2);
        switch(optr){
            case '+': return num1+num2;
            case '-': return num1-num2;
            case '*': return num1*num2;
            case '/': return num1/num2;
        }
       return 0;
    }}


