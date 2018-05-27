VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
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
      Height          =   2055
      Left            =   1560
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   3
      Top             =   240
      Width           =   2895
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Download file"
      Height          =   495
      Left            =   3240
      TabIndex        =   2
      Top             =   2520
      Width           =   1215
   End
   Begin VB.ListBox List1 
      Height          =   2010
      ItemData        =   "ftp.frx":0000
      Left            =   120
      List            =   "ftp.frx":0002
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Get directory"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   2520
      Width           =   1215
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   1800
      Top             =   2520
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim strDirString, strFileName As String
    Dim intStart, intEnd As Integer
    
    strDirString = Inet1.OpenURL("ftp://ftp.microsoft.com")
    
    intStart = InStr(strDirString, """/")
    
    While (intStart <> 0)
        intEnd = InStr(intStart + 4, strDirString, """")
        strFileName = Mid(strDirString, intStart + 2, intEnd - intStart - 2)
        If InStr(strFileName, "/") = 0 Then
            List1.AddItem strFileName
        End If
       intStart = InStr(intEnd + 4, strDirString, """/")
    Wend
    
    
End Sub

Private Sub Command2_Click()
    List1_DblClick
End Sub

Private Sub List1_DblClick()
    Dim bytData() As Byte
    
    If InStr(List1.Text, ".txt") <> 0 Then
        Text1.Text = Inet1.OpenURL("ftp://ftp.microsoft.com/" & List1.Text)
    Else
        bytData() = Inet1.OpenURL("ftp://ftp.microsoft.com/" & List1.Text, icByteArray)
        Open "c:\vbbb\ftp\" & List1.Text For Binary Access Write As #1
        Put #1, , bytData()
        Close #1
        MsgBox "Download complete"
    End If
End Sub

