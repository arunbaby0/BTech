VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   213
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   312
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Blur effect"
      Height          =   495
      Left            =   1800
      TabIndex        =   2
      Top             =   1320
      Width           =   1215
   End
   Begin VB.PictureBox Picture2 
      AutoSize        =   -1  'True
      Height          =   705
      Left            =   1470
      ScaleHeight     =   43
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   127
      TabIndex        =   1
      Top             =   2160
      Width           =   1965
   End
   Begin VB.PictureBox Picture1 
      Height          =   735
      Left            =   1440
      Picture         =   "imageblur.frx":0000
      ScaleHeight     =   45
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   128
      TabIndex        =   0
      Top             =   120
      Width           =   1980
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const intUpperBoundX = 200
Const intUpperBoundY = 200
Dim Pixels(1 To intUpperBoundX, 1 To intUpperBoundY) As Long
Private Sub Command1_Click()
    Dim x, y As Integer
    Dim bytRed, bytGreen, bytBlue As Byte
    
    For x = 1 To intUpperBoundX
        For y = 1 To intUpperBoundY
            Pixels(x, y) = Picture1.Point(x, y)
        Next y
    Next x
    
    For x = 1 To intUpperBoundX - 1
        For y = 1 To intUpperBoundY
            bytRed = Abs((Pixels(x + 1, y) And &HFF) + (Pixels(x, y) And &HFF)) / 2
            bytGreen = Abs(((Pixels(x + 1, y) And &HFF00) / &H100) Mod &H100 + ((Pixels(x, y) And &HFF00) / &H100) Mod &H100) / 2
            bytBlue = Abs(((Pixels(x + 1, y) And &HFF0000) / &H10000) Mod &H100 + ((Pixels(x, y) And &HFF0000) / &H10000) Mod &H100) / 2
            Pixels(x, y) = RGB(bytRed, bytGreen, bytBlue)
         Next y
    Next x
    
    
    For x = 1 To intUpperBoundX
        For y = 1 To intUpperBoundY
            Picture2.PSet (x, y), Pixels(x, y)
        Next y
    Next x
    
End Sub
