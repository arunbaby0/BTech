VERSION 5.00
Begin VB.UserControl TextControl 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1800
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Text            =   "activextextcontrol.ctx":0000
      Top             =   1560
      Width           =   1215
   End
End
Attribute VB_Name = "TextControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True


Private Sub Text1_KeyPress(KeyAscii As Integer)
    If KeyAscii = Asc("L") Then
        KeyAscii = 0
        Beep
    End If
End Sub

Private Sub UserControl_Initialize()
    Text1.Left = 0
    Text1.Top = 0
    Text1.Width = ScaleWidth
    Text1.Height = ScaleHeight
End Sub

