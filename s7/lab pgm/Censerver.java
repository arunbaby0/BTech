import java.util.*;
import java.lang.*;
import java.net.*;
import java.io.*;

class Censerver
{
     DatagramSocket sock;
     DatagramPacket pack;
     InetAddress addr;
     byte[] data;
     Censerver()
     {
        try
        {
            addr=addr.getByName("233.6.9.1");
            sock=new DatagramSocket(5500);
        }
        catch(Exception e)
        {
          System.out.println("Error: "+e);
        }
     }
     public void broadcast()
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
                  data=s.getBytes();
                  pack=new DatagramPacket(data,data.length,addr,5500);
                  sock.send(pack);
           }while(!s.equals("stop")); 
           System.exit(0);
           sock.close();
          
        }
        catch(Exception e)
        {
              System.out.println("Error: "+e);
        }
     }
     public static void main(String args[])
     {
         Censerver server=new Censerver();
         server.broadcast();
System.out.println("exited");
         System.exit(0);
     }
}
     
                  
       
