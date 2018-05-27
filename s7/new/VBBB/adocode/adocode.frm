VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "students"
   ClientHeight    =   2550
   ClientLeft      =   1095
   ClientTop       =   330
   ClientWidth     =   5550
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2550
   ScaleWidth      =   5550
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdLast 
      Caption         =   ">>"
      Height          =   495
      Left            =   4200
      TabIndex        =   11
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   ">"
      Height          =   495
      Left            =   2880
      TabIndex        =   10
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdPrevious 
      Caption         =   "<"
      Height          =   495
      Left            =   1560
      TabIndex        =   9
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "<<"
      Height          =   495
      Left            =   240
      TabIndex        =   8
      Top             =   1920
      Width           =   1215
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   495
      Left            =   2880
      TabIndex        =   6
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdUpdate 
      Caption         =   "Update"
      Height          =   495
      Left            =   1560
      TabIndex        =   5
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Delete"
      Height          =   495
      Left            =   4200
      TabIndex        =   4
      Top             =   1200
      Width           =   1215
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   1320
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   600
      Width           =   3855
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1320
      TabIndex        =   1
      Text            =   "Text1"
      Top             =   120
      Width           =   3855
   End
   Begin VB.Label lblLabels 
      Caption         =   "Grade:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   7
      Top             =   120
      Width           =   1095
   End
   Begin VB.Label lblLabels 
      Caption         =   "Name:"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   0
      Top             =   600
      Width           =   1095
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim adoRecordset As Recordset
Attribute adoRecordset.VB_VarHelpID = -1

Private Sub Form_Load()
    Dim db As Connection
    Set db = New Connection
        
    db.Open "PROVIDER=Microsoft.Jet.OLEDB.3.51;Data Source=C:\vbbb\adocode\db.mdb;"

    Set adoRecordset = New Recordset
    adoRecordset.Open "select Grade, Name from students", db, adOpenStatic, adLockOptimistic
     
    Set Text1.DataSource = adoRecordset
    Text1.DataField = "Name"
    Set Text2.DataSource = adoRecordset
    Text2.DataField = "Grade"

End Sub

Private Sub cmdAdd_Click()
    On Error GoTo ErrLabel
    adoRecordset.AddNew
    
    Text1.Text = ""
    Text2.Text = ""
    
    Exit Sub
    
ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdDelete_Click()
    On Error GoTo ErrLabel
    
    adoRecordset.Delete
    
    adoRecordset.MoveNext
    If adoRecordset.EOF Then
        adoRecordset.MoveLast
    End If
    
    Exit Sub
    
ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdRefresh_Click()
    
    On Error GoTo ErrLabel
    adoRecordset.Requery
    Exit Sub
    
ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdUpdate_Click()
    On Error GoTo ErrLabel

    adoRecordset.Update

    Exit Sub
    
ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdFirst_Click()
    On Error GoTo ErrLabel

    adoRecordset.MoveFirst

    Exit Sub

ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdLast_Click()
    On Error GoTo ErrLabel

    adoRecordset.MoveLast

    Exit Sub

ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdNext_Click()
    On Error GoTo ErrLabel

    If Not adoRecordset.EOF Then
            adoRecordset.MoveNext
    End If
    
    If adoRecordset.EOF And adoRecordset.RecordCount > 0 Then
        adoRecordset.MoveLast
    End If

    Exit Sub
    
ErrLabel:
    MsgBox Err.Description
End Sub

Private Sub cmdPrevious_Click()
    On Error GoTo ErrLabel

    If Not adoRecordset.BOF Then adoRecordset.MovePrevious
    If adoRecordset.BOF And adoRecordset.RecordCount > 0 Then
        adoRecordset.MoveFirst
    End If

    Exit Sub

ErrLabel:
    MsgBox Err.Description
End Sub

