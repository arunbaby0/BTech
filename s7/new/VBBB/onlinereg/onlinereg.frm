VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4860
   LinkTopic       =   "Form2"
   ScaleHeight     =   3195
   ScaleWidth      =   4860
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   495
      Left            =   360
      TabIndex        =   2
      Top             =   2040
      Width           =   3735
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   360
      TabIndex        =   1
      Top             =   1080
      Width           =   3735
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   360
      Top             =   2640
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Register"
      Height          =   495
      Left            =   1800
      TabIndex        =   0
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Thank you for buying our application."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   0
      TabIndex        =   5
      Top             =   120
      Width           =   4815
   End
   Begin VB.Label Label2 
      Caption         =   "Name:"
      Height          =   375
      Left            =   360
      TabIndex        =   4
      Top             =   720
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "email:"
      Height          =   255
      Left            =   360
      TabIndex        =   3
      Top             =   1680
      Width           =   1215
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    Open "c:\temp.dat" For Output As #1
    Print #1, "Registering SuperDuperDataCrunch" & vbCrLf
    Print #1, "Name: " & Text1.Text & vbCrLf
    Print #1, "email: " & Text2.Text & vbCrLf
    Print #1, "Time: " & Format(Now)
    Close #1
        
    Inet1.URL = "ftp://ftp.server.com"
    Inet1.UserName = "steve"
    Inet1.Password = "secret"
    Inet1.Execute , "PUT c:\temp.dat reg.dat"

End Sub

Private Sub Inet1_StateChanged(ByVal State As Integer)
 
    If State = icResponseCompleted Then
        Inet1.Execute , "Close"
            
        Dim FileSystemObject As Object
        Set FileSystemObject = CreateObject("Scripting.FileSystemObject")
        FileSystemObject.DeleteFile "c:\temp.dat"

        Form2.Hide
    End If
End Sub

