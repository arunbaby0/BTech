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
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   8
      Left            =   3120
      TabIndex        =   8
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   7
      Left            =   1680
      TabIndex        =   7
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   6
      Left            =   240
      TabIndex        =   6
      Top             =   2160
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   5
      Left            =   3120
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   4
      Left            =   1680
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   3
      Left            =   240
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   2
      Left            =   3120
      TabIndex        =   2
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   1
      Left            =   1680
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton Command 
      Height          =   495
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim xNow

Private Sub Command_Click(Index As Integer)
    If xNow Then
        Command(Index).Caption = "x"
    Else
        Command(Index).Caption = "o"
    End If
    
    xNow = Not xNow
    
End Sub

Private Sub Form_Load()
    xNow = True
End Sub
