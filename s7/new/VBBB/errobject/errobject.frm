VERSION 5.00
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
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   1800
      TabIndex        =   2
      Top             =   2160
      Width           =   1215
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1800
      TabIndex        =   1
      Top             =   480
      Width           =   1215
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Convert to number"
      Height          =   495
      Left            =   1560
      TabIndex        =   0
      Top             =   1320
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Dim varNumber As Variant
    
    varNumber = MakePositiveNumber(Text1.Text)
    
    If IsError(varNumber) Then
        If CInt(varNumber) = 5 Then
            MsgBox "Number must be positive"
        End If
    Else
        Text2.Text = Str(varNumber)
    End If
End Sub

Public Function MakePositiveNumber(strData As String) As Variant
    Dim intValue As Integer
    
    intValue = Val(strData)
    If intValue < 0 Then
        MakePositiveNumber = CVErr(5)
    Else
        MakePositiveNumber = intValue
    End If
End Function
