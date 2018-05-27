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
      Left            =   720
      TabIndex        =   1
      Top             =   1560
      Width           =   3135
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add 2 + 3 with dynam.dll"
      Height          =   495
      Left            =   720
      TabIndex        =   0
      Top             =   600
      Width           =   3135
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function addem Lib "dynam" (ByVal value1 As Integer, ByVal value2 As Integer) As Integer

Private Sub Command1_Click()
    Text1.Text = "2 + 3 = " & Str(addem(2, 3))
End Sub
