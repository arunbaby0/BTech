import java.util.*;
import java.lang.*;
import java.net.*;
import java.io.*;

class Cenclient implements Runnable
{
    MulticastSocket sock;
    DatagramPacket pack;
    InetAddress addr;
    byte[] data;
    BufferedReader br;
    Thread tc1=new Thread(this,"send");
    Thread tc2=new Thread(this,"receive");
    Cenclient()
    {
        try 
        {
           addr=InetAddress.getByName("233.6.9.1");
           sock=new MulticastSocket(5300);
           sock.joinGroup(addr);
           tc1.start();
           tc2.start();
        }
        catch(Exception e)
        {
           System.out.println("Error:"+e);
        }
    }
    public void run()
    {
        if(Thread.currentThread().getName().equals("send"))
        {
            try
            {
               send();
            }
            catch(Exception e)
            {
               System.out.println("Error: "+e);
            }
        }
        else
        {
            try
            {
               receive();
            }
            catch(Exception e)
            {
               System.out.println("Error: "+e);
            }
        }
    }
    public void send()
    {
        String s="start";
        try
        {
            do
            {
               br=new BufferedReader(new InputStreamReader(System.in));
               s=br.readLine();
               data=s.getBytes();
               pack=new DatagramPacket(data,data.length,addr,5300);
               sock.send(pack);
            }while(!s.equals("stop"));
        } 
        catch(Exception e)
        {
            System.out.println("Error: "+e);
        }
    }
    public void receive()
    {
        String s="start";
        try
        {
            do
            {
               data=new byte[100];
               pack=new DatagramPacket(data,data.length);
               sock.receive(pack);
               s=new String(data);
               System.out.println(s);
            }while(!s.equals("stop"));
            sock.leaveGroup(addr);
            sock.close();
        }
        catch(Exception e)
        {
            System.out.println("Error: "+e);
        }
    }
    public static void main(String args[])
    {
        Cenclient client=new Cenclient();
    }
}
     