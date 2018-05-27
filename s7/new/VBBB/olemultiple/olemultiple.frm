VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3015
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.OLE OLEControls 
      Height          =   1215
      Index           =   1
      Left            =   840
      SizeMode        =   2  'AutoSize
      TabIndex        =   1
      Top             =   1680
      Width           =   3015
   End
   Begin VB.OLE OLEControls 
      Height          =   1215
      Index           =   0
      Left            =   840
      SizeMode        =   2  'AutoSize
      TabIndex        =   0
      Top             =   240
      Width           =   3015
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Begin VB.Menu ActivateObject 
         Caption         =   "Activate object"
      End
      Begin VB.Menu CreateNewOLEControl 
         Caption         =   "Create new OLE control"
      End
   End
   Begin VB.Menu Edit 
      Caption         =   "Edit"
      Begin VB.Menu EditCopy 
         Caption         =   "Copy"
      End
      Begin VB.Menu EditPaste 
         Caption         =   "Paste"
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
Dim intTotalOLEControls As Integer
Dim intXOffset, intYOffset As Integer

Private Sub ActivateObject_Click()
    If TypeOf ActiveControl Is OLE Then
        ActiveControl.DoVerb 0
    End If
End Sub


Private Sub CreateNewOLEControl_Click()
        intTotalOLEControls = intTotalOLEControls + 1
        
        Load OLEControls(intTotalOLEControls - 1)
        OLEControls(intTotalOLEControls - 1).Move 0, 0
        OLEControls(intTotalOLEControls - 1).InsertObjDlg
        
        If OLEControls(intTotalOLEControls - 1).OLEType = None Then
            MsgBox "OLE operation failed."
        End If
End Sub

Private Sub EditPaste_Click()
    If TypeOf ActiveControl Is OLE Then
        If ActiveControl.PasteOK Then
            ActiveControl.Paste
        End If
        If ActiveControl.OLEType = None Then
            MsgBox "OLE operation failed."
        End If
    End If
End Sub

Private Sub Form_Load()
    intTotalOLEControls = 2
End Sub

Private Sub InsertObject_Click()
    If TypeOf ActiveControl Is OLE Then
        ActiveControl.InsertObjDlg
        If ActiveControl.OLEType = None Then
            MsgBox "OLE operation failed."
        End If
    End If
End Sub


Private Sub PasteSpecial_Click()
    If TypeOf ActiveControl Is OLE Then
        If ActiveControl.PasteOK Then
            ActiveControl.PasteSpecialDlg
        End If
        If ActiveControl.OLEType = None Then
            MsgBox "OLE operation failed."
        End If
    End If
End Sub

Private Sub Form_Click()
    Dim intLoopIndex As Integer
    
    For intLoopIndex = 0 To intTotalOLEControls - 1
        OLEControls(intLoopIndex).AppIsRunning = False
    Next intLoopIndex
End Sub

Private Sub OLEControls_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    intXOffset = X
    intYOffset = Y
    OLEControls(Index).Drag vbBeginDrag
End Sub

Private Sub Form_DragDrop(Source As Control, X As Single, Y As Single)
    Source.Move X - intXOffset, Y - intYOffset
End Sub

Private Sub OLEControls_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
    Source.Move X + OLEControls(Index).Left - intXOffset, Y + OLEControls(Index).Top - intYOffset
End Sub

