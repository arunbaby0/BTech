VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
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
   Begin VB.TextBox Text1 
      Height          =   735
      Left            =   240
      TabIndex        =   1
      Text            =   "Here is the text"
      Top             =   480
      Width           =   4215
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   2160
      Top             =   2280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Set font"
      Height          =   495
      Left            =   1800
      TabIndex        =   0
      Top             =   1800
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    On Error GoTo Cancel
    CommonDialog1.Flags = cdlCFBoth Or cdlCFEffects Or cdlCFLimitSize
    CommonDialog1.Min = 12
    CommonDialog1.Max = 24
    CommonDialog1.ShowFont
    Text1.FontName = CommonDialog1.FontName
    Text1.FontBold = CommonDialog1.FontBold
    Text1.FontItalic = CommonDialog1.FontItalic
    Text1.FontUnderline = CommonDialog1.FontUnderline
    Text1.FontSize = CommonDialog1.FontSize
    Text1.FontName = CommonDialog1.FontName
Cancel:
End Sub
