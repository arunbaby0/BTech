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
      Left            =   2760
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   480
      OLEDropMode     =   1  'Manual
      TabIndex        =   0
      Text            =   "OLE Drag!"
      Top             =   1200
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Text1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Text1.OLEDrag
    
End Sub


Private Sub Text1_OLECompleteDrag(Effect As Long)
    MsgBox "Returned OLE effect: " & Effect
End Sub

Private Sub Text1_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
    
    Data.SetData Text1.Text, vbCFText
    AllowedEffects = vbDropEffectMove

End Sub

Private Sub Text2_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Text2.Text = Data.GetData(vbCFText)
End Sub
