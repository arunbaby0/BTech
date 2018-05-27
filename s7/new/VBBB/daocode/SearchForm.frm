VERSION 5.00
Begin VB.Form SearchForm 
   Caption         =   "Search..."
   ClientHeight    =   2625
   ClientLeft      =   2160
   ClientTop       =   1770
   ClientWidth     =   4380
   LinkTopic       =   "Form3"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2625
   ScaleWidth      =   4380
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1560
      TabIndex        =   3
      Top             =   600
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   495
      Left            =   2400
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "OK"
      Height          =   495
      Left            =   480
      TabIndex        =   1
      Top             =   1560
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Search for:"
      Height          =   255
      Left            =   600
      TabIndex        =   0
      Top             =   720
      Width           =   855
   End
End
Attribute VB_Name = "SearchForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Hide
    Call Form1.SearchTable
End Sub


Private Sub Command2_Click()
    Hide
End Sub


