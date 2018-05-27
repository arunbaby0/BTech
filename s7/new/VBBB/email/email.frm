VERSION 5.00
Object = "{20C62CAE-15DA-101B-B9A8-444553540000}#1.1#0"; "MSMAPI32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3405
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5970
   LinkTopic       =   "Form1"
   ScaleHeight     =   3405
   ScaleWidth      =   5970
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   2175
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   2
      Top             =   120
      Width           =   5415
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Read email"
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   2520
      Width           =   1215
   End
   Begin MSMAPI.MAPISession MAPISession1 
      Left            =   1440
      Top             =   1920
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DownloadMail    =   -1  'True
      LogonUI         =   -1  'True
      NewSession      =   0   'False
   End
   Begin MSMAPI.MAPIMessages MAPIMessages1 
      Left            =   2640
      Top             =   1920
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      AddressEditFieldCount=   1
      AddressModifiable=   0   'False
      AddressResolveUI=   0   'False
      FetchSorted     =   0   'False
      FetchUnreadOnly =   0   'False
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Send email"
      Height          =   495
      Left            =   4320
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

    MAPISession1.DownLoadMail = False
    MAPISession1.SignOn
    
    MAPIMessages1.SessionID = MAPISession1.SessionID
    MAPIMessages1.MsgIndex = -1
    MAPIMessages1.Compose
    MAPIMessages1.Send True
    
    MAPISession1.SignOff
End Sub

Private Sub Command2_Click()
    MAPISession1.DownLoadMail = True
    MAPISession1.SignOn
    
    MAPIMessages1.SessionID = MAPISession1.SessionID
    MAPIMessages1.Fetch
    
    MAPIMessages1.MsgIndex = 0
    Text1.Text = MAPIMessages1.MsgNoteText
    
    MAPISession1.SignOff

End Sub
