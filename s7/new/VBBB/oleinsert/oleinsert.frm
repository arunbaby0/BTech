VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2115
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   2115
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.OLE OLE1 
      Height          =   1095
      Left            =   840
      SizeMode        =   2  'AutoSize
      TabIndex        =   0
      Top             =   360
      Width           =   3015
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Begin VB.Menu ActivateObject 
         Caption         =   "Activate object"
      End
   End
   Begin VB.Menu Insert 
      Caption         =   "Insert"
      Begin VB.Menu InsertObject 
         Caption         =   "Insert object"
      End
      Begin VB.Menu PasteSpecial 
         Caption         =   "Paste special"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ActivateObject_Click()
    OLE1.DoVerb 0
End Sub

Private Sub Form_Click()
    OLE1.AppIsRunning = False
End Sub

Private Sub InsertObject_Click()
    OLE1.InsertObjDlg
    If OLE1.OLEType = vbOLENone Then
        MsgBox "OLE operation failed."
    End If
End Sub

Private Sub PasteSpecial_Click()
    If OLE1.PasteOK Then
        OLE1.PasteSpecialDlg
    End If
    If OLE1.OLEType = vbOLENone Then
        MsgBox "OLE operation failed."
    End If
    
End Sub
