VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   2040
      Top             =   2520
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Read binary"
      Height          =   495
      Left            =   3120
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   2175
      Left            =   480
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   1
      Top             =   120
      Width           =   3855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Read HTML"
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   2520
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Text1.Text = Inet1.OpenURL("http://www.microsoft.com/vbasic/default.htm")
End Sub

Private Sub Command2_Click()
    Dim bytData() As Byte
    
    bytData() = Inet1.OpenURL("http://www.microsoft.com/library/images/gifs/toolbar/home.gif", icByteArray)

    Open "c:\vbbb\http\home.gif" For Binary Access Write As #1
    Put #1, , bytData()
    Close #1
    
    MsgBox "home.gif downloaded"
End Sub
