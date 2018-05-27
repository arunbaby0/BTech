VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3795
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5895
   LinkTopic       =   "Form1"
   ScaleHeight     =   3795
   ScaleWidth      =   5895
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      Caption         =   "Month"
      ForeColor       =   &H80000008&
      Height          =   3135
      Left            =   3480
      TabIndex        =   8
      Top             =   240
      Width           =   1935
      Begin VB.OptionButton Option11 
         Caption         =   "April"
         Height          =   495
         Left            =   240
         TabIndex        =   12
         Top             =   2280
         Width           =   1455
      End
      Begin VB.OptionButton Option6 
         Caption         =   "March"
         Height          =   375
         Left            =   240
         TabIndex        =   11
         Top             =   1760
         Width           =   1335
      End
      Begin VB.OptionButton Option5 
         Caption         =   "February"
         Height          =   495
         Left            =   240
         TabIndex        =   10
         Top             =   1120
         Width           =   1455
      End
      Begin VB.OptionButton Option4 
         Caption         =   "January"
         Height          =   615
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Day of the week"
      Height          =   3135
      Left            =   360
      TabIndex        =   0
      ToolTipText     =   "Enter the day here"
      Top             =   240
      Width           =   2895
      Begin VB.OptionButton Option10 
         Caption         =   "Saturday"
         Height          =   375
         Left            =   1680
         TabIndex        =   7
         Top             =   1800
         Width           =   975
      End
      Begin VB.OptionButton Option9 
         Caption         =   "Friday"
         Height          =   375
         Left            =   1680
         TabIndex        =   6
         Top             =   1120
         Width           =   855
      End
      Begin VB.OptionButton Option8 
         Caption         =   "Thursday"
         Height          =   375
         Left            =   1680
         TabIndex        =   5
         Top             =   480
         Width           =   975
      End
      Begin VB.OptionButton Option7 
         Caption         =   "Wednesday"
         Height          =   375
         Left            =   240
         TabIndex        =   4
         Top             =   2400
         Width           =   1215
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Tuesday"
         Height          =   375
         Left            =   240
         TabIndex        =   3
         Top             =   1800
         Width           =   1215
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Monday"
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Top             =   1120
         Width           =   1215
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Sunday"
         Height          =   375
         Left            =   240
         TabIndex        =   1
         Top             =   480
         Width           =   1095
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intXOffset As Integer
Dim intYOffset As Integer


Private Sub Form_DragDrop(Source As Control, X As Single, Y As Single)
    Source.Move X - intXOffset, Y - intYOffset
End Sub

Private Sub Frame1_DragDrop(Source As Control, X As Single, Y As Single)
    Source.Move Source.Left + X - intXOffset, Source.Top + Y - intYOffset
End Sub

Private Sub Frame1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    intXOffset = X
    intYOffset = Y
    Frame1.Drag 1
End Sub
