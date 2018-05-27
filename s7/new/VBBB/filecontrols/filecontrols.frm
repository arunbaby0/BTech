VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3285
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8010
   LinkTopic       =   "Form1"
   ScaleHeight     =   3285
   ScaleWidth      =   8010
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   2415
      Left            =   4320
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   4
      Top             =   120
      Width           =   3615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Display file"
      Height          =   495
      Left            =   4320
      TabIndex        =   3
      Top             =   2640
      Width           =   3615
   End
   Begin VB.FileListBox File1 
      Height          =   3015
      Left            =   2280
      TabIndex        =   2
      Top             =   120
      Width           =   1935
   End
   Begin VB.DirListBox Dir1 
      Height          =   2565
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   2055
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub Dir1_Change()
    File1.Path = Dir1.Path
End Sub

Sub Drive1_Change()
    Dir1.Path = Drive1.Drive
End Sub

Sub File1_DblClick()
    Command1_Click
End Sub

Sub Command1_Click()
    Dim FileName As String
    On Error GoTo FileError
    If (Right$(Dir1.Path, 1) = "\") Then
        FileName = File1.Path & File1.FileName
    Else
        FileName = File1.Path & "\" & File1.FileName
    End If
    Open FileName For Input As #1
    Text1.Text = Input$(LOF(1), #1)
    Close #1
    Exit Sub

FileError:
    MsgBox "File Error!"
End Sub


