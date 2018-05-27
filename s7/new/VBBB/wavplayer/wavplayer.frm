VERSION 5.00
Object = "{C1A8AF28-1257-101B-8FB0-0020AF039CA3}#1.1#0"; "MCI32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3615
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3615
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin MCI.MMControl MMControl1 
      Height          =   495
      Left            =   600
      TabIndex        =   0
      Top             =   1800
      Width           =   3540
      _ExtentX        =   6244
      _ExtentY        =   873
      _Version        =   393216
      DeviceType      =   ""
      FileName        =   ""
   End
   Begin VB.Label Label3 
      Caption         =   "Current operation:"
      Height          =   495
      Left            =   960
      TabIndex        =   3
      Top             =   2640
      Width           =   1335
   End
   Begin VB.Label Label2 
      Caption         =   "Wav Player"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   36
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   480
      TabIndex        =   2
      Top             =   360
      Width           =   3735
   End
   Begin VB.Label Label1 
      Height          =   495
      Left            =   2400
      TabIndex        =   1
      Top             =   2640
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Form_Load()
   MMControl1.FileName = "C:\WINDOWS\MEDIA\DING.WAV"
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
