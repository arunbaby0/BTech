VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "students"
   ClientHeight    =   2460
   ClientLeft      =   1095
   ClientTop       =   330
   ClientWidth     =   5775
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2460
   ScaleWidth      =   5775
   ShowInTaskbar   =   0   'False
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1440
      TabIndex        =   7
      Top             =   840
      Width           =   3375
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1440
      TabIndex        =   6
      Top             =   120
      Width           =   3375
   End
   Begin VB.CommandButton cmdLast 
      Caption         =   ">>"
      Height          =   495
      Left            =   4440
      TabIndex        =   5
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   ">"
      Height          =   495
      Left            =   3120
      TabIndex        =   4
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrevious 
      Caption         =   "<"
      Height          =   495
      Left            =   1680
      TabIndex        =   3
      Top             =   1800
      Width           =   1215
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "<<"
      Height          =   495
      Left            =   240
      TabIndex        =   2
      Top             =   1800
      Width           =   1215
   End
   Begin VB.Label lblLabels 
      Caption         =   "Name:"
      Height          =   255
      Index           =   1
      Left            =   480
      TabIndex        =   1
      Top             =   960
      Width           =   975
   End
   Begin VB.Label lblLabels 
      Caption         =   "Grade:"
      Height          =   255
      Index           =   0
      Left            =   480
      TabIndex        =   0
      Top             =   120
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
    Dim re As Object
    Dim db As rdoConnection
    Dim resultset As rdoResultset
    Dim SQLSel As String

Private Sub Form_Load()
    
    SQLSel = "Select * from students"
    Set re = rdoEngine.rdoEnvironments(0)
    Set db = re.OpenConnection("db")
    
    Set resultset = db.OpenResultset(SQLSel, rdOpenKeyset)
    resultset.MoveFirst
  
    Text1.Text = resultset("Name")
    Text2.Text = resultset("Grade")

End Sub

Private Sub cmdFirst_Click()
    On Error GoTo ErrLabel

    resultset.MoveFirst
    Text1.Text = resultset("Name")
    Text2.Text = resultset("Grade")

    Exit Sub

ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdLast_Click()
    On Error GoTo ErrLabel

    resultset.MoveLast
    
    Text1.Text = resultset("Name")
    Text2.Text = resultset("Grade")

    Exit Sub

ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdNext_Click()
    On Error GoTo ErrLabel

    If Not resultset.EOF Then resultset.MoveNext
    If resultset.EOF And resultset.RowCount > 0 Then
        resultset.MoveLast
    End If
  
    Text1.Text = resultset("Name")
    Text2.Text = resultset("Grade")

    Exit Sub
    
ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdPrevious_Click()
    On Error GoTo ErrLabel

    If Not resultset.BOF Then resultset.MovePrevious
    If resultset.BOF And resultset.RowCount > 0 Then
        resultset.MoveFirst
    End If
    
    Text1.Text = resultset("Name")
    Text2.Text = resultset("Grade")

    Exit Sub

ErrLabel:
    MsgBox Err.Description
End Sub



