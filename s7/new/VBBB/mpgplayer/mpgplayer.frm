VERSION 5.00
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5085
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6255
   LinkTopic       =   "Form1"
   ScaleHeight     =   5085
   ScaleWidth      =   6255
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Height          =   3855
      Left            =   480
      ScaleHeight     =   3795
      ScaleWidth      =   5235
      TabIndex        =   1
      Top             =   120
      Width           =   5295
   End
   Begin MCI.MMControl MMControl1 
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   4200
      Width           =   3540
      _ExtentX        =   6244
      _ExtentY        =   873
      _Version        =   393216
      DeviceType      =   ""
      FileName        =   ""
   End
   Begin VB.Label Label2 
      Caption         =   "Status:"
      Height          =   495
      Left            =   4440
      TabIndex        =   3
      Top             =   4200
      Width           =   615
   End
   Begin VB.Label Label1 
      Height          =   495
      Left            =   5160
      TabIndex        =   2
      Top             =   4200
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    MMControl1.FileName = "c:\demo\.mpg"
    MMControl1.hWndDisplay = Picture1.hWnd
    MMControl1.Command = "Open"
End Sub

Private Sub MMControl1_StatusUpdate()
    Dim strMode As String
    strMode = ""
    
    Select Case MMControl1.Mode
    
        Case mciModeReady
            strMode = "Ready."
        
        Case mciModeStop
            strMode = "Stopped."
        
        Case mciModeSeek
            strMode = "Seeking."
            
        Case mciModePlay
            strMode = "Playing."
        
        Case mciModeRecord
            strMode = "Recording."
        
        Case mciModePause
            strMode = "Paused."
        
    End Select
    
    Label1.Caption = strMode
    
End Sub

Private Sub Form_Unload(Cancel As Integer)
    MMControl1.Command = "Stop"
    MMControl1.Command = "Close"
End Sub
