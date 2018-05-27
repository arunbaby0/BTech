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
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   2400
      TabIndex        =   5
      Top             =   840
      Width           =   1215
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   2400
      TabIndex        =   4
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   840
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Read from file"
      Height          =   495
      Left            =   2400
      TabIndex        =   1
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Write to file"
      Height          =   495
      Left            =   360
      TabIndex        =   0
      Top             =   2280
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim WriteData(1 To 50) As Record
Dim ReadData(1 To 50) As Record
Dim TotalRecords As Integer

Private Sub Command1_Click()
    WriteData(1).Name = Text1.Text
    WriteData(1).Number = Text2.Text
    TotalRecords = 1
    
    On Error GoTo FileError
    Open "c:\records.dat" For Random As #1 Len = Len(WriteData(1))
    For intLoopIndex = 1 To TotalRecords
        Put #1, , WriteData(intLoopIndex)
    Next intLoopIndex
    Close #1
    Exit Sub

FileError:
    MsgBox "File Error!"

End Sub

Private Sub Command2_Click()
    Dim intLoopIndex As Integer

    Open "c:\records.dat" For Random As #1 Len = Len(ReadData(1))

    For intLoopIndex = 1 To LOF(1) / Len(ReadData(1))
        Get #1, , ReadData(intLoopIndex)
    Next intLoopIndex

    Close #1

    Text3.Text = ReadData(1).Name
    Text4.Text = ReadData(1).Number

    Exit Sub
    
FileError:
    MsgBox "File Error!"
End Sub
