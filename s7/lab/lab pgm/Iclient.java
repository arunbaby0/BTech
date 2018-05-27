import java.io.*;
import java.net.*;
public class Iclient
{
 public static void main(String args[])
  {
Socket sc;   
try
    {
     
     sc=new Socket("localhost",8000);

BufferedReader b1=new BufferedReader(new InputStreamReader(System.in));
BufferedReader b2=new BufferedReader(new InputStreamReader(sc.getInputStream()));
PrintWriter p=new PrintWriter(sc.getOutputStream(),true);
  
  System.out.println("1.Echo Server");
  System.out.println("2.Date and Time Service");
  System.out.println("Enter Your Choice");
  String st=b1.readLine();
   p.println(st);
  if(st.equals("1"))
     {
      String s1=b2.readLine();  
	System.out.println(s1);
      String s2=b1.readLine();
      p.println(s2);
        s1=b2.readLine();
       System.out.println(s1);
      }
   else if(st.equals("2"))
     {
       String s3=b2.readLine();
       System.out.println("Current date and Time is:"+s3);
      }
   else
     {
       String s4=b2.readLine();
        System.out.println(s4);
    }
 
 
  }
  catch(Exception e)
   {
    }
  }
}
