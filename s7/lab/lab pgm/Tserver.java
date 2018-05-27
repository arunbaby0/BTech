import java.io.*;
import java.lang.*;
import java.net.*;




class Tserver implements Runnable
{
BufferedReader br1,br2;
PrintWriter pw;
String s1,s2;
Thread t1,t2;
Boolean flag=true;
	Socket s;
Tserver()
	{
	try{
	ServerSocket ss=new ServerSocket(3000);
	System.out.println("Server listening");
	 s=ss.accept();
	System.out.println("client connected");
	t1=new Thread(this);
	t2=new Thread(this);
	t1.start();
	t2.start();
	}//try
	catch(Exception e)
	{
	System.out.println(e);
	}//catch
	}//Constructer
public void run()
{
	try{
	while(flag){

	if(Thread.currentThread()==t1)
	{
	br1=new BufferedReader(new InputStreamReader(s.getInputStream()));
	s1=br1.readLine();
	if(s1.equals("exit"))
	{
	System.out.println("Client terminates");
	flag=false;
	break;
	}
	System.out.println("Client:"+s1);
	
	}
	else
	{
	

	 if(Thread.currentThread()==t2)
	{
	

	br2=new BufferedReader(new InputStreamReader(System.in));
	s2=br2.readLine();
	pw=new PrintWriter(s.getOutputStream(),true);
	pw.println(s2);
	}}
	}
	}//try
catch(Exception e)
{
System.out.println(e);
}//catch

}//run


public static void main(String args[])
{
Tserver tw=new Tserver();
}
}
