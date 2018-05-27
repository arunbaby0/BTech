import java.io.*;
import java.net.*;

public class BiClient
{
 public static void main(String args[]) throws IOException
 {
  try
  {
	Socket s= new Socket("localhost",3000);	
        BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
	BufferedReader br1 = new BufferedReader(new InputStreamReader(System.in));
	PrintWriter pw=new PrintWriter(s.getOutputStream(),true);
	while(true)
        {
	System.out.println("Enter data and type 'exit' to return...");
	String str=br1.readLine();
	if(str.equals("exit"))
	{
	 pw.println("exit");
	 break;
	}
	pw.println(str);
	String str1= br.readLine();
	if(str1.equals("exit"))
	 break;
	System.out.println("From server:"+str1);	
	}
	System.out.println("Client exited...");	
	s.close();	
  }
  catch (IOException ioe)
  {
   System.err.println(ioe);
  }
 } 
}

