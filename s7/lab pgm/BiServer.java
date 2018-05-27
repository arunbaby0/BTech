import java.io.*;
import java.net.*;

public class BiServer
{
 public static void main(String args[]) throws IOException
 {
  try
  {
	ServerSocket ss = new ServerSocket(3000);
	System.out.println("Server listening..");
	Socket s = ss.accept();
	System.out.println("Client connected..");	
	BufferedReader br = new BufferedReader(new InputStreamReader(s.getInputStream()));
	BufferedReader br1 = new BufferedReader(new InputStreamReader(System.in));
	PrintWriter pw=new PrintWriter(s.getOutputStream(),true);
	while(true)
	{	
	String str=br.readLine();
	if(str.equals("exit"))
		break;
	System.out.println("From client:"+str);
	System.out.println("Enter data and type 'exit' to return...");
	String str1= br1.readLine();
	if(str1.equals("exit"))
	{
         pw.println("exit");
	 break;
	}
	pw.println(str1);
        }
	System.out.println("Server exited...");	
	s.close();
	ss.close();
  }

  catch (IOException ioe) 
  {
   System.err.println(ioe);
  }
 } 
}
