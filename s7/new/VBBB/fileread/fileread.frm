VERSION 5.00
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
   Begin VB.CommandButton Command1 
      Caption         =   "Read text from file"
      Height          =   495
      Left            =   1440
      TabIndex        =   1
      Top             =   2520
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   2055
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   240
      Width           =   3735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim NewLine As String
    
    On Error GoTo FileError
    Open "c:\file.txt" For Input As #1
    'Do Until EOF(1)
    '    Line Input #1, NewLine
    '    Text1.Text = Text1.Text + NewLine + vbCrLf
    'Loop
    Text1.Text = Input$(LOF(1), #1)
    Exit Sub
    
FileError:
    MsgBox "File Error!"
End Sub
