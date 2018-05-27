VERSION 5.00
Begin VB.Form Form1 
   ClientHeight    =   3570
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6435
   LinkTopic       =   "Form1"
   ScaleHeight     =   3570
   ScaleWidth      =   6435
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   5565
      Top             =   2880
   End
   Begin VB.Shape Shape4 
      Height          =   810
      Left            =   4260
      Shape           =   3  'Circle
      Top             =   735
      Width           =   1020
   End
   Begin VB.Shape Shape3 
      Height          =   1290
      Left            =   2610
      Shape           =   3  'Circle
      Top             =   1545
      Width           =   1410
   End
   Begin VB.Shape Shape2 
      Height          =   495
      Left            =   930
      Shape           =   3  'Circle
      Top             =   2445
      Width           =   1215
   End
   Begin VB.Shape Shape1 
      Height          =   1605
      Left            =   960
      Shape           =   3  'Circle
      Top             =   480
      Width           =   2625
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    Randomize
End Sub

Private Sub Timer1_Timer()
    Shape1.Move Shape1.Left + ScaleWidth * (Rnd - 0.5) / 50, Shape1.Top + ScaleHeight * (Rnd - 0.5) / 50
    Shape2.Move Shape2.Left + ScaleWidth * (Rnd - 0.5) / 50, Shape2.Top + ScaleHeight * (Rnd - 0.5) / 50
    Shape3.Move Shape3.Left + ScaleWidth * (Rnd - 0.5) / 50, Shape3.Top + ScaleHeight * (Rnd - 0.5) / 50
    Shape4.Move Shape4.Left + ScaleWidth * (Rnd - 0.5) / 50, Shape4.Top + ScaleHeight * (Rnd - 0.5) / 50
End Sub
