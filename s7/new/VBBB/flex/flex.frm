VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
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
      Height          =   285
      Left            =   1680
      TabIndex        =   1
      Top             =   1800
      Visible         =   0   'False
      Width           =   855
   End
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   2415
      Left            =   600
      TabIndex        =   0
      Top             =   240
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   4260
      _Version        =   393216
      Rows            =   10
      Cols            =   10
      FocusRect       =   2
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    MSFlexGrid1.Col = 1
    MSFlexGrid1.Sort = 1
End Sub

Sub Form_Load()
Dim intLoopIndex As Integer

    For intLoopIndex = MSFlexGrid1.FixedRows To MSFlexGrid1.Rows - 1
        MSFlexGrid1.TextArray(MSFlexGrid1.Cols * intLoopIndex) = intLoopIndex
    Next

    For intLoopIndex = MSFlexGrid1.FixedCols To MSFlexGrid1.Cols - 1
        MSFlexGrid1.TextArray(intLoopIndex) = Chr(Asc("A") + intLoopIndex - 1)
    Next

End Sub

Sub MSFlexGrid1_KeyPress(KeyAscii As Integer)

    Text1.Text = Text1.Text & Chr(KeyAscii)
    Text1.SelStart = 1

    Text1.Move MSFlexGrid1.CellLeft + MSFlexGrid1.Left, MSFlexGrid1.CellTop + MSFlexGrid1.Top, MSFlexGrid1.CellWidth, MSFlexGrid1.CellHeight
    Text1.Visible = True

    Text1.SetFocus

End Sub

Sub MSFlexGrid1_LeaveCell()

    If Text1.Visible = False Then
        Exit Sub
    End If
    MSFlexGrid1.Text = Text1
    Text1.Visible = False
    Text1.Text = ""
End Sub


