import java.awt.*;
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.awt.event.*;
class CalcClient{
public static void main(String args[]){
	new Connection();
	new Calculator();
}
}
class Connection{
	Socket c;
        public static PrintWriter p;
        public static BufferedReader b;
	public Connection(){
		try{
		c=new Socket("localhost",7000);
                p=new PrintWriter(c.getOutputStream(),true);
                b=new BufferedReader(new InputStreamReader(c.getInputStream()));
		}
		catch(Exception e)
		{
			System.out.println("\nServer not found");
			System.exit(0);
		}
	}

}
class Calculator extends JFrame implements ActionListener,WindowListener{
	JButton[] b;
	JButton badd,bsub,bmul,bdiv,beq;
	JTextField display;
	int i,f=0;
        String s="",qs="";
	public Calculator(){
		super("Calculator");
		Container c=this.getContentPane();
		display=new JTextField(12);
                display.setEditable(false);
                 display.setBackground(Color.WHITE);
		b=new JButton[10];
		for(i=0;i<10;i++){
		b[i]=new JButton(Integer.toString(i));
		b[i].addActionListener(this);
		}
		badd=new JButton("+");
		bsub=new JButton("-");
		bmul=new JButton("*");
		bdiv=new JButton("/");
		beq=new JButton("=");
		badd.addActionListener(this);
		bsub.addActionListener(this);
		bmul.addActionListener(this);
		bdiv.addActionListener(this);
		beq.addActionListener(this);
                BorderLayout bl=new BorderLayout();
                bl.setVgap(10);
                c.setLayout(bl);
                c.add(display,BorderLayout.NORTH);
                JPanel p=new JPanel();
                c.setBackground(Color.GRAY);
                p.setBackground(Color.GRAY);
		    c.add(p,BorderLayout.CENTER);
                c.add(new JLabel(" "),BorderLayout.WEST);       
                GridLayout g=new GridLayout(5,3);
                g.setVgap(5);
                g.setHgap(5);
                p.setLayout(g);	
		for(i=0;i<10;i++){
			p.add(b[i]);
		}
		p.add(badd);                
		p.add(bsub);
		p.add(bmul);
		p.add(bdiv);
		p.add(beq);
                new Thread(){           
                public void run(){
                    String sp;
                try {
                    while(true){
                    sp = Connection.b.readLine();
                    display.setText(sp);
                    }
                } catch (IOException ex) {                
                }
                }
                }.start();
		setSize(180,225);
		setResizable(false);
                setLocation(500,400);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setVisible(true);
	}
	public void actionPerformed(ActionEvent e){
                if(f==1){
                    s="";
                    qs="";
                    f=0;
                }
		JButton k=(JButton)e.getSource();
                String ss=k.getText();              
                if(ss.equals("+")||ss.equals("-")||ss.equals("*")||ss.equals("/")){
                    qs=qs+ss;
                    s="";
                }
                else if(ss.equals("=")){                    
                    Connection.p.println(qs);
                    f=1;
                }
                else{
                    s=s+ss;
                    qs=qs+ss;
                    display.setText(s);
                }
        }
    public void windowOpened(WindowEvent e) {  }
    public void windowClosing(WindowEvent e) {
        Connection.p.println("exit");
    }
    public void windowClosed(WindowEvent e) {}
    public void windowIconified(WindowEvent e) {}
    public void windowDeiconified(WindowEvent e) {}
    public void windowActivated(WindowEvent e) {}
    public void windowDeactivated(WindowEvent e) {}
}

