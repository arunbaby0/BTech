VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuFile 
      Caption         =   "File"
      Begin VB.Menu mnuNew 
         Caption         =   "New"
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "Open"
      End
      Begin VB.Menu mnuClose 
         Caption         =   "Close"
      End
   End
   Begin VB.Menu mnuHelpMenu 
      Caption         =   "Help"
      Begin VB.Menu mnuHelp 
         Caption         =   "Help"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const HELP_CONTEXT = &H1
Const HELP_QUIT = &H2
Const HELP_INDEX = &H3
Const HELP_CONTENTS = &H3&
Const HELP_HELPONHELP = &H4
Const HELP_SETINDEX = &H5
Const HELP_SETCONTENTS = &H5&
Const HELP_CONTEXTPOPUP = &H8&
Const HELP_FORCEFILE = &H9&
Const HELP_KEY = &H101
Const HELP_COMMAND = &H102&
Const HELP_PARTIALKEY = &H105&
Const HELP_MULTIKEY = &H201&
Const HELP_SETWINPOS = &H203&

Private Declare Function WinHelp Lib "user32" Alias "WinHelpA" (ByVal hwnd As Long, ByVal lpHelpFile As String, ByVal wCommand As Long, ByVal dwData As Long) As Long

Private Sub mnuClose_Click()
    MsgBox "You selected the Close item."
End Sub

Private Sub mnuHelp_Click()
    retVal = WinHelp(Form1.hwnd, "c:\vbbb\helper\helper.hlp", HELP_CONTENTS, CLng(0))
End Sub

Private Sub mnuNew_Click()
    MsgBox "You selected the New item."
End Sub

Private Sub mnuOpen_Click()
    MsgBox "You selected the Open item."
End Sub
