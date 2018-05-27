VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Form1"
   ClientHeight    =   3420
   ClientLeft      =   3030
   ClientTop       =   5790
   ClientWidth     =   8190
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3420
   ScaleWidth      =   8190
   Begin VB.Data Data1 
      Caption         =   "Data1"
      Connect         =   "Access"
      DatabaseName    =   "C:\vbbb\draggrid\db.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   375
      Left            =   600
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   2  'Snapshot
      RecordSource    =   "students"
      Top             =   3000
      Visible         =   0   'False
      Width           =   1815
   End
   Begin MSFlexGridLib.MSFlexGrid MSFlexGrid1 
      Bindings        =   "draggrid.frx":0000
      DragIcon        =   "draggrid.frx":0014
      Height          =   2655
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   4683
      _Version        =   393216
      Cols            =   3
      FixedCols       =   0
      BackColorBkg    =   -2147483633
      GridColor       =   -2147483630
      HighLight       =   2
      SelectionMode   =   1
      AllowUserResizing=   1
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim intDragColumn As Integer

Private Sub MSFlexGrid1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    intDragColumn = MSFlexGrid1.MouseCol
    MSFlexGrid1.Drag 1
    
End Sub
Private Sub MSFlexGrid1_DragDrop(Source As VB.Control, X As Single, Y As Single)
    
    MSFlexGrid1.ColPosition(intDragColumn) = MSFlexGrid1.MouseCol

End Sub




