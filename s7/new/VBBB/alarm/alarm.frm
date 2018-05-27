VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2955
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5385
   LinkTopic       =   "Form1"
   ScaleHeight     =   2955
   ScaleWidth      =   5385
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton OnButton 
      Caption         =   "Alarm On"
      Height          =   495
      Index           =   1
      Left            =   2160
      TabIndex        =   2
      Top             =   1920
      Width           =   1215
   End
   Begin VB.OptionButton OnButton 
      Caption         =   "Alarm Off"
      Height          =   495
      Index           =   2
      Left            =   3840
      TabIndex        =   1
      Top             =   1920
      Value           =   -1  'True
      Width           =   1215
   End
   Begin VB.TextBox AlarmSetting 
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   2280
      Width           =   1215
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   1800
      Top             =   2400
   End
   Begin VB.Label Label1 
      Caption         =   "Alarm setting:"
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1920
      Width           =   1215
   End
   Begin VB.Label Display 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   48
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1335
      Left            =   240
      TabIndex        =   3
      Top             =   360
      Width           =   4935
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim AlarmOn As Boolean

Sub OnButton_Click(Index As Integer)
    If (Index = 1) Then
        AlarmOn = True
    Else
        AlarmOn = False
    End If
End Sub

Sub Timer1_Timer()
    If (Time$ > AlarmSetting.Text And AlarmOn) Then
        Beep
    End If
    Display.Caption = Time$
End Sub

Sub AlarmSetting_KeyPress(KeyAscii As Integer)
    Dim Key As String
    Key = Chr$(KeyAscii)
    If ((Key < "0" Or Key > "9") And Key <> ":") Then
        Beep
        KeyAscii = 0
    End If
End Sub
