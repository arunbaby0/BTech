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
   Begin VB.CommandButton CommandArray 
      Caption         =   "Button"
      Height          =   495
      Index           =   3
      Left            =   3360
      TabIndex        =   3
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton CommandArray 
      Caption         =   "Button"
      Height          =   495
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Top             =   2640
      Width           =   1215
   End
   Begin VB.CommandButton CommandArray 
      Caption         =   "Button"
      Height          =   495
      Index           =   1
      Left            =   3240
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton CommandArray 
      Caption         =   "Button"
      Height          =   495
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Click()
    Dim intNextIndex As Integer
    
    intNextIndex = CommandArray.UBound + 1
    Load CommandArray(intNextIndex)
    CommandArray(intNextIndex).Visible = True
    CommandArray(intNextIndex).Caption = "New button"
    CommandArray(intNextIndex).Move ScaleWidth / 2 - CommandArray(intNextIndex).Width / 2, ScaleHeight / 2 - CommandArray(intNextIndex).Height / 2
End Sub

Private Sub CommandArray_Click(Index As Integer)
    MsgBox "You clicked button " & Index
End Sub


