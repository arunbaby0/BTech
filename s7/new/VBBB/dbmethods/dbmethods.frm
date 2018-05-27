VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "students"
   ClientHeight    =   2835
   ClientLeft      =   1995
   ClientTop       =   1800
   ClientWidth     =   5760
   LinkTopic       =   "Form2"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2835
   ScaleWidth      =   5760
   Begin VB.CommandButton cmdLast 
      Caption         =   "Last"
      Height          =   375
      Left            =   4440
      TabIndex        =   11
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "First"
      Height          =   375
      Left            =   3000
      TabIndex        =   10
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrevious 
      Caption         =   "Previous"
      Height          =   375
      Left            =   1560
      TabIndex        =   9
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Height          =   375
      Left            =   4440
      TabIndex        =   7
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   375
      Left            =   2880
      TabIndex        =   6
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      Height          =   375
      Left            =   1560
      TabIndex        =   5
      Top             =   960
      Width           =   1215
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   960
      Width           =   1215
   End
   Begin VB.Data Data1 
      Caption         =   "students"
      Connect         =   "Access"
      DatabaseName    =   "C:\vbbb\dbmethods\db.mdb"
      DefaultCursorType=   0  'DefaultCursor
      DefaultType     =   2  'UseODBC
      Exclusive       =   0   'False
      Height          =   345
      Left            =   0
      Options         =   0
      ReadOnly        =   0   'False
      RecordsetType   =   1  'Dynaset
      RecordSource    =   "students"
      Top             =   2280
      Width           =   5760
   End
   Begin VB.TextBox Text2 
      DataField       =   "Grade"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   1
      Left            =   2040
      MaxLength       =   10
      TabIndex        =   3
      Top             =   360
      Width           =   3615
   End
   Begin VB.TextBox Text1 
      DataField       =   "Name"
      DataSource      =   "Data1"
      Height          =   285
      Index           =   0
      Left            =   2040
      MaxLength       =   10
      TabIndex        =   1
      Top             =   40
      Width           =   3615
   End
   Begin VB.Label lblLabels 
      Caption         =   "Grade:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   380
      Width           =   1815
   End
   Begin VB.Label lblLabels 
      Caption         =   "Name:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   60
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAdd_Click()
  Data1.Recordset.AddNew
End Sub

Private Sub cmdDelete_Click()
  Data1.Recordset.Delete
  Data1.Recordset.MoveNext
End Sub

Private Sub cmdFirst_Click()
  Data1.Recordset.MoveFirst
End Sub

Private Sub cmdLast_Click()
  Data1.Recordset.MoveLast
End Sub

Private Sub cmdNext_Click()
  Data1.Recordset.MoveNext
End Sub

Private Sub cmdPrevious_Click()
  Data1.Recordset.MovePrevious
End Sub

Private Sub cmdRefresh_Click()
  Data1.Refresh
End Sub

Private Sub cmdUpdate_Click()
  Data1.UpdateRecord
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub


