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
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1080
      TabIndex        =   1
      Top             =   600
      Width           =   2775
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add 2 + 2 using Microsoft Excel"
      Height          =   495
      Left            =   1080
      TabIndex        =   0
      Top             =   1680
      Width           =   2775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim objExcel As Object
    Set objExcel = CreateObject("Excel.Sheet")
    
    objExcel.Cells(1, 1).Value = "2"
    objExcel.Cells(2, 1).Value = "2"
    
    objExcel.Cells(3, 1).Formula = "=R1C1 + R2C1"
    Text1.Text = "Microsoft Excel says: 2 + 2 = " & objExcel.Cells(3, 1)
    
    objExcel.Application.Quit
End Sub

