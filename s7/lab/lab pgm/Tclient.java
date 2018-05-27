import java.io.*;
import java.net.*;
import java.lang.*;


class Tclient implements Runnable
{
Thread t1,t2;
Socket s;
BufferedReader br1,br2;
PrintWriter pw;
String s1,s2;
Boolean flag=true;
Tclient()
	{

		try{
		 s=new Socket("localhost",3000);
		t1=new Thread(this);
		t2=new Thread(this);
		t1.start();
		t2.start();
		System.out.println("Enter data");
		}//try

		catch(Exception e)
		{
		System.out.println(e);
		}
	}
public void run()
	{
		try{
			do
			{

			if(Thread.currentThread()==t1)
				{
				br1=new BufferedReader(new InputStreamReader(System.in));
				s1=br1.readLine();
			
				pw=new PrintWriter(s.getOutputStream(),true);
				pw.println(s1);
					if(s1.equals("exit"))
					{
					System.out.println("Client terminates");
					flag=false;
					break;
					}	
	
				}//if
			else 
				{
				if(Thread.currentThread()==t2)
					{
	
					br2=new BufferedReader(new InputStreamReader(s.getInputStream()));
					s2=br2.readLine();
					System.out.println("Server:"+s2);
					}	
				}//else	
	
	
			}while(!s1.equals("exit"));//while

  		 }//try

		catch(Exception e)
		{
		System.out.println(e);
		}
	}//run

public static void main(String args[])
{
Tclient t=new Tclient();
}


}//Tclient
