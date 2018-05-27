VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   Caption         =   "Spreadsheet"
   ClientHeight    =   2415
   ClientLeft      =   1470
   ClientTop       =   1860
   ClientWidth     =   4425
   LinkTopic       =   "Form1"
   ScaleHeight     =   2415
   ScaleWidth      =   4425
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Height          =   2055
      Left            =   360
      TabIndex        =   0
      Top             =   120
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   3625
      _Version        =   393216
      Rows            =   7
      Cols            =   7
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Sub Form_Load()
    Dim Items(6) As String
    Dim intLoopIndex As Integer
    
    Items(1) = "Item 1"
    Items(2) = "Item 2"
    Items(3) = "Item 3"
    Items(4) = "Item 4"
    Items(5) = "Item 5"
    Items(6) = "Total"
    
    For intLoopIndex = 1 To MSFlexGrid1.Rows - 1
        MSFlexGrid1.Col = 0
        MSFlexGrid1.Row = intLoopIndex
        MSFlexGrid1.Text = Str(intLoopIndex)
        MSFlexGrid1.Col = 1
        MSFlexGrid1.Text = Items(intLoopIndex)
    Next intLoopIndex
    
    MSFlexGrid1.Row = 0
    For intLoopIndex = 1 To MSFlexGrid1.Cols - 1
        MSFlexGrid1.Col = intLoopIndex
        MSFlexGrid1.Text = Chr(Asc("A") - 1 + intLoopIndex)
    Next intLoopIndex
    
    MSFlexGrid1.Row = 1
    MSFlexGrid1.Col = 1
    
End Sub

Sub MSFlexGrid1_KeyPress(KeyAscii As Integer)
    Dim intRowIndex As Integer
    Dim Sum As Integer
        
    MSFlexGrid1.Text = MSFlexGrid1.Text + Chr$(KeyAscii)
    OldRow = MSFlexGrid1.Row
    OldCol = MSFlexGrid1.Col
    MSFlexGrid1.Col = 2
    Sum = 0
    
    For intRowIndex = 1 To MSFlexGrid1.Rows - 2
        MSFlexGrid1.Row = intRowIndex
        Sum = Sum + Val(MSFlexGrid1.Text)
    Next intRowIndex
    
    MSFlexGrid1.Row = MSFlexGrid1.Rows - 1
    MSFlexGrid1.Text = Str(Sum)
    MSFlexGrid1.Row = OldRow
    MSFlexGrid1.Col = OldCol
End Sub

