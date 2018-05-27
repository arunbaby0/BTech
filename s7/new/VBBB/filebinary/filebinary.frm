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
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   2520
      TabIndex        =   3
      Top             =   960
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   480
      TabIndex        =   2
      Top             =   960
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Read binary data"
      Height          =   495
      Left            =   2520
      TabIndex        =   1
      Top             =   1800
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Write binary data"
      Height          =   495
      Left            =   480
      TabIndex        =   0
      Top             =   1800
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim varOutput As Double
    varOutput = Val(Text1.Text)
    
    On Error GoTo FileError
    Open "c:\binary.dat" For Binary As #1
    Put #1, , varOutput
    Close #1
    Exit Sub

FileError:
    MsgBox "File Error!"
End Sub

Private Sub Command2_Click()
    Dim varInput As Double
    
    On Error GoTo FileError
    Open "c:\binary.dat" For Binary As #1
    Get #1, , varInput
    Text2.Text = Str(varInput)
    Close #1
    Exit Sub

FileError:
    MsgBox "File Error!"

End Sub
