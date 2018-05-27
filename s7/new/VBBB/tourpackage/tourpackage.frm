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
   Begin VB.Frame Frame2 
      Caption         =   "Cities"
      Height          =   2775
      Left            =   2520
      TabIndex        =   1
      Top             =   240
      Width           =   1815
      Begin VB.CheckBox Check4 
         Caption         =   "Hong Kong"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   2280
         Width           =   1455
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Boston"
         Height          =   375
         Left            =   240
         TabIndex        =   4
         Top             =   1720
         Width           =   1335
      End
      Begin VB.CheckBox Check2 
         Caption         =   "London"
         Height          =   495
         Left            =   240
         TabIndex        =   3
         Top             =   1040
         Width           =   1095
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Paris"
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Top             =   480
         Width           =   1335
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Tour"
      Height          =   2775
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   1815
      Begin VB.OptionButton Option4 
         Caption         =   "Package 4"
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   2280
         Width           =   1335
      End
      Begin VB.OptionButton Option3 
         Caption         =   "Package 3"
         Height          =   495
         Left            =   240
         TabIndex        =   8
         Top             =   1640
         Width           =   1335
      End
      Begin VB.OptionButton Option2 
         Caption         =   "Package 2"
         Height          =   495
         Left            =   240
         TabIndex        =   7
         Top             =   1000
         Width           =   1455
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Package 1"
         Height          =   375
         Left            =   240
         TabIndex        =   6
         Top             =   480
         Width           =   1215
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Option1_Click()
    Check1.Value = 1
    Check2.Value = 0
    Check3.Value = 1
    Check4.Value = 0
End Sub

Private Sub Option2_Click()
    Check1.Value = 0
    Check2.Value = 1
    Check3.Value = 0
    Check4.Value = 1
End Sub

Private Sub Option3_Click()
    Check1.Value = 1
    Check2.Value = 1
    Check3.Value = 0
    Check4.Value = 0
End Sub

Private Sub Option4_Click()
    Check1.Value = 1
    Check2.Value = 1
    Check3.Value = 1
    Check4.Value = 1
End Sub
