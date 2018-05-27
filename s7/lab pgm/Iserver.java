import java.io.*;
import java.net.*;
import java.util.*;
public class Iserver
{
 public static void main(String args[])
  {
Socket c;
ServerSocket s;
BufferedReader b1,b2;
PrintWriter p1,p2;
String str1,str2,str3;
try
    {
  

 s=new ServerSocket(8000); 
while(true)
   {
  c=s.accept();

  b1=new BufferedReader(new InputStreamReader(c.getInputStream()));
  p1=new PrintWriter(c.getOutputStream(),true);
  String str=b1.readLine();
   System.out.println("Selected choice is"+str); 
if(str.equals("1"))
   {

p1.println("Connected with server...Enter data to echo");
str1=b1.readLine();
p1.println(str1);
    
}
 else if(str.equals("2"))
   {
Date date=new Date();
p1.println(date.toString());
   
    }
  else
   {
p1.println("Error");
    }


c.close();
  }

}
  catch(Exception e)
   {
    }
  }
}