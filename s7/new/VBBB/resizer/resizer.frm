VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub DrawBox()
    Line (ScaleWidth / 4, ScaleHeight / 4)-(3 * ScaleWidth / 4, _
    3 * ScaleHeight / 4), , B
End Sub
Private Sub Form_Load()
    DrawBox
End Sub
Private Sub Form_Resize()
    Cls
    DrawBox
End Sub


