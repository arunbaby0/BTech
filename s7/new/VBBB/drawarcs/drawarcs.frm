VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   4560
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5880
   LinkTopic       =   "Form1"
   ScaleHeight     =   4560
   ScaleWidth      =   5880
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Draw arcs"
      Height          =   495
      Left            =   1800
      TabIndex        =   1
      Top             =   1200
      Width           =   2295
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   1215
      Left            =   1560
      ScaleHeight     =   1155
      ScaleWidth      =   2715
      TabIndex        =   0
      Top             =   2040
      Width           =   2775
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

    Circle (ScaleWidth / 2, ScaleHeight / 2), _
    Switch(ScaleWidth >= ScaleHeight, ScaleHeight / 2, _
    ScaleWidth < ScaleHeight, ScaleWidth / 2), , 0, 3.14, 0.8
    
    Picture1.Circle (Picture1.ScaleWidth / 2, Picture1.ScaleHeight / 2), _
    Switch(Picture1.ScaleWidth >= Picture1.ScaleHeight, Picture1.ScaleHeight / 2, _
    Picture1.ScaleWidth < Picture1.ScaleHeight, Picture1.ScaleWidth / 2), , 3.14, 6.28, 0.8
    
End Sub

