import java.net.*;
import java.io.*;
import java.lang.*;
import java.util.*;

class Uclient
{
   MulticastSocket sock;
   DatagramPacket pack;
   InetAddress addr;
   byte[] data;
   Uclient()
   {
     try
     {
        addr=InetAddress.getByName("233.6.9.1");
        sock=new MulticastSocket(6300);
        sock.joinGroup(addr);
     }
     catch(Exception e)
     {
        System.out.println(e);
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
        }while(!s.equals("end"));
        sock.leaveGroup(addr);
        sock.close();
     }
     catch(Exception e)
     {
        System.out.println(e);
     }
  }
  public static void main(String args[])
  {
     Uclient client=new Uclient();
     client.receive();
  }
}