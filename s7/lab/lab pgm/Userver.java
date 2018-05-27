import java.net.*;
import java.io.*;
import java.lang.*;
import java.util.*;

class Userver
{
   DatagramSocket sock;
   DatagramPacket pack;
   BufferedReader br;
   InetAddress addr;
   byte[] data;
   Userver()
   {
     try
     {
        addr=InetAddress.getByName("233.6.9.1");
        sock=new DatagramSocket(6300);
     }
     catch(Exception e)
     {
        System.out.println(e);
     }
   }
   public void bcast()
   {
     String s="start";
     try
     {
        do
        {
           br=new BufferedReader(new InputStreamReader(System.in));
           s=br.readLine();
           data=s.getBytes();
           pack=new DatagramPacket(data,data.length,addr,6300);
           sock.send(pack);
        }while(!s.equals("end"));
        sock.close();
     }
     catch(Exception e)
     {
        System.out.println(e);
     }
   }
   public static void main(String args[])
   {
      Userver server=new Userver();
      server.bcast();
   }
}        
   

