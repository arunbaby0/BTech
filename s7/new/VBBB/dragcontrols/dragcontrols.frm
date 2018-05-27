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
   Begin VB.TextBox Textboxes 
      Height          =   495
      Index           =   5
      Left            =   3000
      TabIndex        =   5
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox Textboxes 
      Height          =   495
      Index           =   4
      Left            =   3000
      TabIndex        =   4
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox Textboxes 
      Height          =   495
      Index           =   3
      Left            =   3000
      TabIndex        =   3
      Top             =   360
      Width           =   1215
   End
   Begin VB.TextBox Textboxes 
      Height          =   495
      Index           =   2
      Left            =   720
      TabIndex        =   2
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox Textboxes 
      Height          =   495
      Index           =   1
      Left            =   720
      TabIndex        =   1
      Top             =   1320
      Width           =   1215
   End
   Begin VB.TextBox Textboxes 
      Height          =   495
      Index           =   0
      Left            =   720
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intXOffset, intYOffset As Integer


Private Sub Form_Load()
    For Each objText In Textboxes
        objText.Text = "Drag me"
    Next
End Sub

Private Sub Textboxes_DragOver(Index As Integer, Source As Control, X As Single, Y As Single, State As Integer)
    Textboxes(Index).BackColor = RGB(0, 0, 255)
End Sub

Private Sub Textboxes_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    intXOffset = X
    intYOffset = Y
    Textboxes(Index).Drag vbBeginDrag
End Sub

Private Sub Form_DragDrop(Source As Control, X As Single, Y As Single)
    Source.Move X - intXOffset, Y - intYOffset
End Sub

Private Sub TextBoxes_DragDrop(Index As Integer, Source As Control, X As Single, Y As Single)
    Source.Move X + Textboxes(Index).Left - intXOffset, Y + Textboxes(Index).Top - intYOffset
End Sub


