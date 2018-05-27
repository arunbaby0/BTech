VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   2850
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4125
   LinkTopic       =   "Form1"
   ScaleHeight     =   2850
   ScaleWidth      =   4125
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Start animation"
      Height          =   495
      Left            =   1560
      TabIndex        =   1
      Top             =   1560
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      Height          =   375
      Left            =   1200
      ScaleHeight     =   315
      ScaleWidth      =   1995
      TabIndex        =   0
      Top             =   840
      Width           =   2055
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1800
      Top             =   2400
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim picObjects(1 To 2) As Picture

Private Sub Command1_Click()
    Timer1.Enabled = True
End Sub

Private Sub Form_Load()
    Set picObjects(1) = LoadPicture("c:\vbbb\pictureanimation\image1.bmp")
    Set picObjects(2) = LoadPicture("c:\vbbb\pictureanimation\image2.bmp")
End Sub

Private Sub Timer1_Timer()
    Static blnImage1 As Boolean

    If blnImage1 Then
        Picture1.Picture = picObjects(1)
    Else
        Picture1.Picture = picObjects(2)
    End If
   
    blnImage1 = Not blnImage1

End Sub
