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
Private Sub Form_Load()
    Dim intLoopIndex As Integer
    
    For intLoopIndex = 1 To 9
        DrawWidth = intLoopIndex
        Line (0, intLoopIndex * ScaleHeight / 10)-(ScaleWidth, _
        intLoopIndex * ScaleHeight / 10)
    Next intLoopIndex
    
    DrawMode = vbInvert
    DrawWidth = 10
    Line (0, 0)-(ScaleWidth, ScaleHeight)
    Line (0, ScaleHeight)-(ScaleWidth, 0)
End Sub
