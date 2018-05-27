VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2745
   ClientLeft      =   1485
   ClientTop       =   1860
   ClientWidth     =   6465
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   2745
   ScaleWidth      =   6465
   Begin VB.CommandButton Command8 
      Caption         =   "Delete Record"
      Height          =   495
      Left            =   120
      TabIndex        =   13
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton Command7 
      Caption         =   ">>"
      Height          =   495
      Left            =   5040
      TabIndex        =   11
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command6 
      Caption         =   ">"
      Height          =   495
      Left            =   4200
      TabIndex        =   10
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command5 
      Caption         =   "<"
      Height          =   495
      Left            =   3360
      TabIndex        =   9
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command4 
      Caption         =   "<<"
      Height          =   495
      Left            =   2520
      TabIndex        =   8
      Top             =   1920
      Width           =   495
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Update Database"
      Height          =   495
      Left            =   120
      TabIndex        =   6
      Top             =   2040
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Edit Record"
      Height          =   495
      Left            =   120
      TabIndex        =   5
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Add New Record"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   240
      Width           =   1575
   End
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   3720
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   3720
      TabIndex        =   2
      Top             =   480
      Width           =   1215
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   5880
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.Label Label3 
      Height          =   255
      Left            =   3720
      TabIndex        =   12
      Top             =   0
      Width           =   1215
   End
   Begin VB.Label Label4 
      Caption         =   "Table Name:"
      Height          =   375
      Left            =   2520
      TabIndex        =   7
      Top             =   0
      Width           =   1215
   End
   Begin VB.Label Label2 
      Caption         =   "Field2"
      Height          =   495
      Left            =   2520
      TabIndex        =   1
      Top             =   1320
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Field1"
      Height          =   495
      Left            =   2520
      TabIndex        =   0
      Top             =   600
      Width           =   1215
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Begin VB.Menu NewDatabase 
         Caption         =   "New Database..."
      End
      Begin VB.Menu OpenDatabase 
         Caption         =   "Open Database..."
      End
      Begin VB.Menu CloseDatabase 
         Caption         =   "Close Database"
      End
      Begin VB.Menu separator1 
         Caption         =   "-"
      End
      Begin VB.Menu NewTable 
         Caption         =   "New Table..."
      End
      Begin VB.Menu separator2 
         Caption         =   "-"
      End
      Begin VB.Menu Search 
         Caption         =   "Search..."
      End
      Begin VB.Menu Sort 
         Caption         =   "Sort"
      End
      Begin VB.Menu separator3 
         Caption         =   "-"
      End
      Begin VB.Menu ExitItem 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    Dim db As Database
    Dim td As TableDef, TempTd As TableDef
    Dim fields(2) As Field, indexfield As Field
    Dim dbindex As Index
    Dim dbrecordset As Recordset

Private Sub NewDatabase_Click()
    CommonDialog1.ShowSave
    If CommonDialog1.FileName <> "" Then
        Set db = DBEngine.Workspaces(0).CreateDatabase(CommonDialog1.FileName, dbLangGeneral)
    End If
End Sub

Sub CreateTable()
    Set td = db.CreateTableDef(TableForm.Text1.Text)
    
    Set fields(0) = td.CreateField(TableForm.Text2.Text, dbText)
    Set fields(1) = td.CreateField(TableForm.Text3.Text, dbText)
    td.fields.Append fields(0)
    td.fields.Append fields(1)

    Set dbindex = td.CreateIndex(TableForm.Text2.Text & "index")
    Set indexfield = dbindex.CreateField(TableForm.Text2.Text)
    dbindex.fields.Append indexfield
    td.Indexes.Append dbindex
    db.TableDefs.Append td

    Set dbrecordset = db.OpenRecordset(TableForm.Text1.Text, dbOpenTable)
    
    Label3.Caption = TableForm.Text1.Text
    Label1.Caption = TableForm.Text2.Text
    Label2.Caption = TableForm.Text3.Text
    
    Text1.Text = ""
    Text2.Text = ""

End Sub

Sub SearchTable()
    dbrecordset.Seek "=", SearchForm.Text1.Text
    Text1.Text = dbrecordset.fields(0)
    Text2.Text = dbrecordset.fields(1)
End Sub


Private Sub CloseDatabase_Click()
    db.Close
    Text1.Text = ""
    Text2.Text = ""
    Label1.Caption = ""
    Label2.Caption = ""
    Label3.Caption = ""
End Sub

Private Sub Command1_Click()
    dbrecordset.AddNew
    Text1.Text = ""
    Text2.Text = ""
End Sub

Private Sub Command2_Click()
    dbrecordset.Edit
End Sub

Private Sub Command3_Click()
    dbrecordset.fields(0) = Text1.Text
    dbrecordset.fields(1) = Text2.Text
    dbrecordset.Update
End Sub


Private Sub Command4_Click()
    dbrecordset.MoveFirst
    Text1.Text = dbrecordset.fields(0)
    Text2.Text = dbrecordset.fields(1)
End Sub

Private Sub Command5_Click()
    dbrecordset.MovePrevious
    If dbrecordset.BOF Then
        dbrecordset.MoveNext
    Else
        Text1.Text = dbrecordset.fields(0)
        Text2.Text = dbrecordset.fields(1)
    End If
End Sub

Private Sub Command6_Click()
    dbrecordset.MoveNext
    If dbrecordset.EOF Then
        dbrecordset.MovePrevious
    Else
        Text1.Text = dbrecordset.fields(0)
        Text2.Text = dbrecordset.fields(1)
    End If
End Sub


Private Sub Command7_Click()
    dbrecordset.MoveLast
    Text1.Text = dbrecordset.fields(0)
    Text2.Text = dbrecordset.fields(1)
End Sub


Private Sub Command8_Click()
    Text1.Text = ""
    Text2.Text = ""
    dbrecordset.Delete
End Sub

Private Sub ExitItem_Click()
    End
End Sub


Private Sub NewTable_Click()
    TableForm.Text1.Text = ""
    TableForm.Text2.Text = ""
    TableForm.Text3.Text = ""
    TableForm.Show
End Sub


Private Sub OpenDatabase_Click()
    Dim table1index As Integer
    CommonDialog1.ShowOpen
    If CommonDialog1.FileName <> "" Then
        Set db = DBEngine.Workspaces(0).OpenDatabase(CommonDialog1.FileName)
        
        table1index = 0
        While (db.TableDefs(table1index).Attributes And dbSystemObject)
            table1index = table1index + 1
        Wend
        
        Set dbrecordset = db.OpenRecordset(db.TableDefs(table1index).Name, dbOpenTable)
        Set td = db.TableDefs(table1index)
        
        Label1.Caption = dbrecordset.fields(0).Name
        Label2.Caption = dbrecordset.fields(1).Name
        Label3.Caption = dbrecordset.Name
        Text1.Text = dbrecordset.fields(0)
        Text2.Text = dbrecordset.fields(1)
    End If
End Sub


Private Sub Search_Click()
    Set dbindex = td.Indexes(0)
    dbrecordset.Index = dbindex.Name
    SearchForm.Show
End Sub

Sub Sort_Click()
    Set dbindex = td.Indexes(0)
    dbrecordset.Index = dbindex.Name
    Text1.Text = dbrecordset.fields(0)
    Text2.Text = dbrecordset.fields(1)
End Sub


