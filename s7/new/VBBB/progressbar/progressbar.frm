VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4755
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4755
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   3480
      Top             =   2160
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Show progress"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   2160
      Width           =   1215
   End
   Begin ComctlLib.ProgressBar ProgressBar1 
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   4575
      _ExtentX        =   8070
      _ExtentY        =   1296
      _Version        =   393216
      Appearance      =   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    ProgressBar1.Value = 0
    Timer1.Enabled = True
End Sub

Private Sub Form_Load()
    Timer1.Enabled = False
    ProgressBar1.Value = 0
End Sub

Private Sub Timer1_Timer()
    ProgressBar1.Value = ProgressBar1.Value + 10
    If ProgressBar1.Value >= 100 Then Timer1.Enabled = False
End Sub
